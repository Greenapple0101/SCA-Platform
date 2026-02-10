# SCA Platform (Student Collection & Achievement)

## Problem
제가 수년간 학원강사로 일하며 교육 현장에서 반복적으로 관찰한 문제는 **학생이 공부를 지속하지 않는다** 였습니다.  
특히 소규모 학원/공부방 환경에서는 학생별 수준 차이가 커서 **개인 과외에 가까운 관리**가 필요하지만,  
대형 학원용 LMS는 운영 방식이 맞지 않아 도입 효과가 떨어집니다.

## Target
- **Primary**: 소규모 학원 / 공부방 교사(소수 인원 대상 개인화 관리)
- **Secondary**: 학생(동기 유지가 어렵고, 즉각적 보상에 반응)

## Core Hypothesis
학습 과제를 **“성취-보상-진행” 루프**로 구조화하고, 게임 메커니즘(레이드/수집/상태 가시화)을 결합하면  
학생의 단기 흥미를 장기 행동으로 전환할 수 있고, 교사의 운영 부담을 낮출 수 있다.

---

## 제가 핵심적으로 기여한 부분 (Impact-first)
### 1) Product Planning (Persona-driven)
- 학원 강사 경험 기반 문제 정의 → **소규모 학원 운영 맥락에 최적화된 UX/루프 설계**
- 학생 페르소나(즉각 피드백/확률형 몰입/패배주의) → 기능(Raid/Gacha/Status)으로 매핑

### 2) Backend Module (Raid) — End-to-End
- 상태 전이/원자 트랜잭션/권한 경계/RaidLog/WebSocket 실시간 브로드캐스트 구현

### 3) Infrastructure / Deployment (Troubleshooting → Stabilization)
- 배포 실패를 “복구”가 아니라 **재현 가능한 빌드/자동화/운영 검증/재발 방지**로 구조화(변수화·체크리스트)

---

## Persona-driven Feature Design
실제 학원에서 관찰한 학생 유형을 페르소나로 만들고, 각 페르소나의 문제를 해결하는 기능으로 연결했습니다.

1) **즉각적 흥미에 반응하는 학생**
- 설계: **Raid(협동 보스전)**
- 의도: 퀘스트 보상(탐사 데이터)을 즉시 HP 감소로 연결 → **행동-즉시 피드백** + 학급 단위 몰입

2) **확률형 보상에 강하게 몰입하는 학생**
- 설계: **Gacha / Collection(가챠·도감)**
- 의도: 몰입 성향을 부정하지 않고 **학습 루프로 전환**하는 구조 제공

3) **패배주의가 강하고, 가시적 성취가 필요한 학생**
- 설계: **Quest Status(제출 필요 / 승인 대기 / 완료)**
- 의도: 말로 다그치기보다 상태/누적 기록으로 **자기 성취 확인 → 행동 유지**

---

## Teacher Experience (Operational Efficiency)
교사의 운영 효율을 핵심 목표로 UX를 설계했습니다.
- **반 생성 → 학생 목록 → 학생 상세 → 퀘스트 등록/승인**까지 흐름 단순화
- 클릭 수 최소화, 필요한 정보를 한 화면에서 빠르게 확인

---

## AI Reward Recommendation (Why it exists)
동일 과제/동일 보상은 개인화 관리 의도와 충돌하지만, 교사가 학생별 난이도/노력치를 매번 계량하는 것은 비현실적입니다.  
이를 해결하기 위해 **AI 보상 추천 기능**을 설계했습니다.

### Input / Output
- 입력: **퀘스트 텍스트**, **소요 시간(또는 범주화)**, **학생별 계수(초기 시험 점수 기반)**
- 산출: **게임 재화(코랄, 탐사 데이터) 추천 보상치**

### How it works
- LLM이 과제 텍스트를 해석하고 **블룸의 인지적 분류** 관점에서 인지 난이도 평가
- 소요 시간을 노력 점수로 환산
- 인지 점수 + 노력 점수에 학생별 계수를 적용 → 개인화 보상 도출
- 교사 수정값 발생 시 수정 폭을 분류하고 **EMA로 계수 자동 업데이트** → 추천 품질 점진 보정

### Outcome
- **퀘스트 1건당 보상 결정 시간 55% 단축**
- 교사 운영 부담 감소 및 개인화 보상 일관성 강화

---

## Overview
- 회원가입/로그인 시 **교사/학생 역할** 선택
- 교사: 반 생성 후 퀘스트/레이드 기반으로 학급 목표와 성취 운영
- 학생: 퀘스트 수행 → 보상 획득 → 레이드 참여 및 수집 요소로 동기 강화

---

## Key Features
### 교사(Teacher)
- 반 생성 및 관리(여러 반 운영)
- 학생 목록 조회
- 퀘스트 등록/운영(개인 퀘스트 / 단체 퀘스트)
- 제출 퀘스트 승인 및 피드백 작성
- 레이드 등록 및 진행 현황 관리
- AI 보상 추천(학생별 맞춤 보상)

### 학생(Student)
- 대시보드: 공지/이벤트, 레이드/단체퀘스트 현황, 보유 재화, 시스템 로그
- 퀘스트 확인 및 제출(상태 배지: 제출 필요 / 승인 대기중)
- 보상 재화로 가챠 진행, 수족관/도감 수집
- 탐사 데이터로 레이드 공격 및 로그 확인(공격량 기준 정렬)

---

## Backend Module: Raid (Design & Implementation)
- **Domain & Lifecycle**
  - 상태 전이: `ACTIVE`, `COMPLETED`, `EXPIRED`, `TERMINATED`
  - 엔티티 내부 도메인 메서드로 상태 변경 일관성 확보

- **Data Model**
  - `Raid`: 수명주기 및 보스 HP 관리
  - `Contribution`: `(raid_id, student_id)` 유니크 제약으로 중복 참여/누적 충돌 방지
  - `RaidLog`: 공격/자원/잔여 HP/타입 기록, 페이징 조회 지원

- **Business Logic**
  - 원자적 공격 처리: 자원 차감 → HP 반영 → 기여도 업데이트 → 로그 적재를 단일 트랜잭션으로 처리
  - RBAC 기반 교사/학생 API 경계 분리
  - 조회 시점 만료 판단 후 `EXPIRED` 전환(Lazy 정합성)

- **Realtime (WebSocket)**
  - 레이드 룸 기반 세션 관리(ConcurrentHashMap) + 실시간 로그 브로드캐스트
  - 잘못된 경로 접근 즉시 종료, 송신 실패 로깅으로 가용성 확보

- **Operational Stability**
  - `CustomException` + `ErrorCode`로 실패 케이스 표준화
  - 동시성 경합 시나리오를 유니크 제약/하한 보정/트랜잭션 일관성으로 방어
  - 향후 개선: 낙관적 락(@Version), 비관적 락, 원자적 업데이트 쿼리 검토

---

## Infrastructure / Deployment (Troubleshooting → Stabilization)
배포 실패를 단순 복구가 아니라 **재현 가능한 빌드, 자동화된 배포, 운영 검증, 재발 방지(변수화/체크리스트)**로 구조화했습니다.

- **EC2 Docker 빌드에서 JAR 누락으로 COPY 실패**
  - 조치: 멀티스테이지 빌드로 전환(컨테이너 내부 Gradle 빌드), `build/libs/*.jar` 다중 산출물 안전 처리
  - 성과: 호스트 선빌드 의존 제거, 배포 재현성 확보  
  - Reference: commits `a50c076`, `bff33a5`, `30858d1` / `DEPLOY-EC2-FIXED.md`

- **Docker 빌드 실패가 캐시/잔여 리소스 영향으로 반복**
  - 조치: `--no-cache`, orphan 제거, `system prune`을 표준 루틴으로 고정
  - 성과: 재시도가 아니라 절차로 실패 제거  
  - Commands: `docker compose build --no-cache`, `docker compose down --remove-orphans`, `docker system prune -a --volumes -f`

- **MySQL 연결 실패 원인 추측 반복**
  - 조치: 컨테이너 상태 → 네트워크 → 로그 → 외부 DB 설정(DB_URL/계정/권한) 순 점검 플로우 정리
  - 성과: 재현 가능한 체크리스트로 장애 대응 체계화  
  - Tools: `docker network inspect`, `docker logs`, SG/Firewall 점검

- **`ddl-auto: validate`에서 스키마 미존재로 부팅 실패**
  - 조치: validate 전제(테이블 선생성) 문서화, `schema.sql` 적용 여부 + `SHOW TABLES;` 검증 절차 고정
  - 성과: 환경/초기화 상태에 따른 장애를 명시적 전제 + 검증으로 통제

- **Jenkins 파이프라인 실패(권한/도커/포트)**
  - 조치: Console Output 기반 원인 확인 + 실행권한/도커 데몬 접근권한/컨테이너·포트 점검 루틴 정리
  - 성과: 실패 시 `down → up -d`로 즉시 복구 가능한 흐름 확보

- **헬스체크 포트 불일치(8080 vs 8081)로 “정상인데 실패”**
  - 조치: 외부 노출 포트와 헬스체크 호출 포트 불일치 진단, `${BACKEND_PORT}`로 단일화
  - 성과: 하드코딩 제거, 배포/검증/메시지의 단일 변수 세트 동기화

- **운영에서 프론트 요청이 `localhost`로 호출되어 Load failed**
  - 조치: Vite API URL은 빌드타임 고정 → Jenkins 빌드 단계에서 `VITE_API_BASE_URL` 주입
  - 성과: 배포 환경 차이로 인한 실패를 CI 단계에서 선제 차단  
  - Reference: `PRODUCTION_API_URL_FIX.md`, `API_URL_SETUP_EXPLANATION.md`

- **프록시/경로 불일치(`/api/api`, WebSocket 101 실패)**
  - 조치: FE URL 조합 규칙과 Nginx 프록시(`/api`, `/ws`) 정렬, Upgrade/Connection 헤더 명시
  - 성과: 실시간 기능 포함 운영 경로 안정화, 배포 후 `curl`/브라우저 네트워크 탭 스모크 테스트 절차 고정

---

## Frontend Architecture (Component Design)
화면 조립이 아니라 **책임 단위 모듈 설계, 상태 전이 통제, 계약 기반 인터페이스** 중심으로 컴포넌트를 개발했습니다.

- **Responsibility-based 분리**
  - Feature/Page: 학생/교사 도메인별 페이지 분리
  - Action: 생성/관리/승인/조회 유스케이스 기준 분리
  - Presentation: 재사용 UI는 `components/ui`로 격리
  - Cross-cutting: 라우팅/컨텍스트/API 전용 레이어 분리

- **Directory를 Boundary로 사용(레이어드 관점)**
  - `components/ui`: 표현 전용 프리미티브
  - `components/student`, `components/teacher`: 유스케이스 조합 레벨
  - `utils/api.ts`: 인프라 어댑터(API 호출)
  - `contexts/AppContext.tsx`: 도메인 상태 허브
  - `routes/AppRoutes.tsx`: 정책 라우터/진입점

- **Contract-first 프로세스**
  - props/이벤트/callback/상태 소유권을 구현 전에 고정
  - 페이지(유스케이스)와 UI(표현/상호작용) 분리로 결합도 감소
  - 외부 의존(API/라우팅/전역상태)은 상위 레이어에서 주입 → UI 컴포넌트 독립성 유지

---

## Business Direction / Roadmap
SCA는 단순 과제 관리 도구가 아니라, 소규모 학원을 위한 **데이터 기반 동기부여·보상 플랫폼**을 목표로 합니다.
- (Roadmap) 과제/학생 데이터 확장 → **유사 과제 사례 기반 추천(RAG)** 등 정교한 개인화 발전

---

## Screenshots

공통 화면 (Login / Sign Up)

| 로그인(Login) | 회원가입(Sign Up) |
| --- | --- |
| <img src="https://github.com/user-attachments/assets/a22b4851-e5b5-42c3-9121-f7ca3da9ddfa" width="420" /> | <img src="https://github.com/user-attachments/assets/c7615d14-0bb8-4bf9-bac0-69e73e07ebf1" width="420" /> |

교사 화면 (Teacher)

#### 교사 대시보드 / 반 생성
| 교사 대시보드 | 교사 반 생성 |
| --- | --- |
| <img src="https://github.com/user-attachments/assets/44fa6030-4fac-4902-a194-e0be47e5c4e3" width="520" /> | <img src="https://github.com/user-attachments/assets/fc58531e-9cce-4b1f-a67d-e20744aacde7" width="520" /> |

#### 반 관리
<img src="https://github.com/user-attachments/assets/ffe6b0fb-550c-4868-84d7-efe06a86012f" width="920" />

#### 퀘스트 등록/승인
<img src="https://github.com/user-attachments/assets/af94d84d-f39d-4c3b-b568-8b38d9f9eb8a" width="920" />

| 개인 퀘스트 등록 | 개인 퀘스트 등록 |
| --- | --- |
| <img src="https://github.com/user-attachments/assets/f34293da-da49-46eb-8200-d53e39775052" width="520" /> | <img src="https://github.com/user-attachments/assets/92b64bd0-dc65-438f-8870-a9ae4df3bf4c" width="520" /> |

| AI 보상 추천 | AI 보상 추천 |
| --- | --- |
| <img src="https://github.com/user-attachments/assets/195c0ea4-75c5-4abb-b75e-972ef5082b1a" width="520" /> | <img src="https://github.com/user-attachments/assets/d2f75a6d-95c9-4f59-a8d7-f67de08fe439" width="520" /> |

| 퀘스트 승인 | 퀘스트 승인 |
| --- | --- |
| <img src="https://github.com/user-attachments/assets/1173b139-bfcb-4633-82e4-7820e06136d7" width="520" /> | <img src="https://github.com/user-attachments/assets/0569b21b-1bba-4653-a900-37e5b9506e61" width="520" /> |

#### 레이드
| 레이드 등록 | 레이드 관리 |
| --- | --- |
| <img src="https://github.com/user-attachments/assets/91608f8d-3e3a-4c8f-a2af-0b553fcdace0" width="520" /> | <img src="https://github.com/user-attachments/assets/c6aa0b8f-d6db-49b7-ae73-2b66d4c5e79b" width="520" /> |

- 보스 HP 기본 수식: `HP = 학생 수 × 레이드 기간(일) × 일일 기준 탐사데이터 × 난이도 계수`

| 특별 보상 설정 | 레이드 화면 |
| --- | --- |
| <img src="https://github.com/user-attachments/assets/b19cae85-eda3-4298-8a60-9017043149a2" width="520" /> | <img src="https://github.com/user-attachments/assets/56c7854d-2460-4159-bf7f-d33550776a00" width="520" /> |

학생 화면 (Student)

| 학생 대시보드 | 학생 대시보드 |
| --- | --- |
| <img src="https://github.com/user-attachments/assets/43e4b0d0-d8f6-405f-b814-421235565277" width="420" /> | <img src="https://github.com/user-attachments/assets/f16d2343-1ad4-426c-a9f3-88366aa4ec0a" width="420" /> |

| 퀘스트 확인 | 퀘스트 제출 |
| --- | --- |
| <img src="https://github.com/user-attachments/assets/32c52666-6d30-4444-8471-3b18fad7d1c4" width="420" /> | <img src="https://github.com/user-attachments/assets/00180d0d-9e03-4eee-9589-e48143e7551d" width="420" /> |

| 만료/완료 퀘스트 | 피드백 확인 |
| --- | --- |
| <img src="https://github.com/user-attachments/assets/3fc81bf1-5192-4127-8a49-726cd9beb0aa" width="420" /> | <img src="https://github.com/user-attachments/assets/844850c7-ea16-4775-a590-df3b1eb352fc" width="420" /> |

| 가챠 | 가챠 결과 | 가챠 상세 |
| --- | --- | --- |
| <img src="https://github.com/user-attachments/assets/eec1ae3b-8122-41c0-bcb2-eb286fac4e98" width="260" /> | <img src="https://github.com/user-attachments/assets/e547f9da-a872-4c5e-8b5d-75dbb10132e1" width="260" /> | <img src="https://github.com/user-attachments/assets/63e1edec-db7c-4be3-b0fb-cee84e310db1" width="260" /> |

| 수족관 | 도감 | 도감 상세 |
| --- | --- | --- |
| <img src="https://github.com/user-attachments/assets/bc55bf39-0378-414a-93e5-68a76bba9597" width="260" /> | <img src="https://github.com/user-attachments/assets/ba35038a-4203-49c1-8127-948c2de3566d" width="260" /> | <img src="https://github.com/user-attachments/assets/4a05d763-7382-4472-b7da-5071bb5d9eec" width="260" /> |

| 레이드 | 레이드 공격 | 레이드 로그 |
| --- | --- | --- |
| <img src="https://github.com/user-attachments/assets/bcf6b256-5c6b-4c40-acbc-6e54eb9a75de" width="260" /> | <img src="https://github.com/user-attachments/assets/2cc15163-484b-461d-a7b0-c1b650784bac" width="260" /> | <img src="https://github.com/user-attachments/assets/eebf6042-027c-44d8-8218-d7772d6f1992" width="260" /> |


---

