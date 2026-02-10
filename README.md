# SCA Platform (Student Collection & Achievement)

학생의 학습 및 행동 성취를 퀘스트/레이드/수집(가챠) 구조로 운영할 수 있는 교사·학생 통합 학습 관리 플랫폼입니다.

---
## Product Planning (My Role)

### Problem
제가 수년간 학원강사로 일하며, 교육 현장에서 반복적으로 관찰한 문제는 “학생이 공부를 지속하지 않는다”였습니다.  
특히 소규모 학원/공부방 환경에서는 학생별 수준 차이가 커서 사실상 개인 과외에 가까운 관리가 필요하지만, 대형 학원용 LMS는 운영 방식이 맞지 않아 도입 효과가 떨어집니다.

### Target
- Primary: 소규모 학원 / 공부방 교사(소수 인원 대상 개인화 관리)
- Secondary: 학생(동기 유지가 어렵고, 즉각적 보상에 반응하는 사용자)

### Core Hypothesis
학습 과제를 “성취-보상-진행” 루프로 구조화하고, 게임 메커니즘(레이드/수집/상태 가시화)을 결합하면  
학생의 단기 흥미를 장기 행동으로 전환할 수 있고, 교사의 운영 부담을 낮출 수 있다.

---

### Persona-driven Feature Design
기획은 실제 학원에서 관찰한 학생 유형을 페르소나로 만들고, 각 페르소나의 문제를 해결하는 기능으로 연결하는 방식으로 진행했습니다.

1) 즉각적 흥미에 반응하는 학생  
- 설계: Raid(협동 보스전)  
- 의도: 퀘스트 보상(탐사 데이터)을 즉시 HP 감소로 연결해 “행동-즉시 피드백”을 만들고, 학급 단위 몰입을 유도

2) 확률형 보상에 강하게 몰입하는 학생  
- 설계: Gacha / Collection(가챠·도감)  
- 의도: 중독적인 몰입 성향을 부정하기보다 “공부에 대한 몰입 루프”로 전환할 수 있는 구조 제공

3) 패배주의가 강하고, 눈에 보이는 성취가 필요했던 학생  
- 설계: Quest Status(제출 필요 / 승인 대기 / 완료) 시각화  
- 의도: 말로 다그치는 대신, 상태와 누적 기록을 통해 “내가 해낸 것”을 스스로 확인하게 하여 행동 유지

---

### Teacher Experience (Operational Efficiency)
교사는 관리 효율을 핵심 목표로 두고 UX를 설계했습니다.  
- 반 생성 → 학생 목록 → 학생 상세 → 퀘스트 등록/승인까지 흐름을 단순화
- 클릭 수를 최소화하고, 필요한 정보를 한 화면에서 빠르게 확인하도록 구성

---

### Validation & Iteration
프로토타입 이후 실제 학생 대상 시연에서 동기 유발 요소(레이드/가챠/상태 가시화)에 대한 긍정 평가를 확인했습니다.  
다만 운영 과정에서 “보상량 기준이 불명확”하면 불만이 쌓이고 동기가 저하될 수 있다는 리스크가 발견되었습니다.

---

### AI Reward Recommendation (Why it exists)
모든 학생에게 동일 과제/동일 보상을 주는 것은 개인화 관리라는 기획 의도와 충돌합니다.  
그러나 교사가 매번 학생별 난이도와 노력 정도를 계량해 보상을 책정하는 것은 현실적으로 어렵습니다.  
이를 해결하기 위해 AI 보상 추천 기능을 설계했습니다.

- 입력: 퀘스트 텍스트, 소요 시간(또는 범주화), 학생별 계수(초기 시험 점수 기반)
- 산출: 게임 재화(코랄, 탐사 데이터) 추천 보상치

작동 개요
- LLM이 과제 텍스트를 해석하고 블룸의 인지적 분류 관점에서 인지 난이도를 평가
- 소요 시간을 노력 점수로 환산
- 인지 점수 + 노력 점수에 학생별 계수를 적용해 개인화 보상을 도출
- 교사의 수정값이 발생하면 수정 폭을 분류하고 EMA로 계수를 자동 업데이트하여 추천 품질을 점진적으로 보정

Outcome
- 퀘스트 1건당 보상 결정 시간 55% 단축(기존 대비)
- 교사 운영 부담 감소 및 개인화 보상 일관성 강화

---

### Business Direction
SCA는 단순 과제 관리 도구가 아니라, 소규모 학원을 위한 데이터 기반 동기부여·보상 플랫폼을 목표로 합니다.  
향후에는 과제/학생 데이터를 확장해 “유사 과제 사례 기반 추천(RAG)” 등 정교한 개인화로 발전시키는 로드맵을 고려하고 있습니다.

---


## Overview
- 회원가입/로그인 시 교사/학생 역할을 선택합니다.
- 교사는 반을 생성하고 퀘스트/레이드 기반으로 학급 목표와 성취를 운영합니다.
- 학생은 퀘스트를 수행해 보상을 획득하고, 레이드 참여 및 수집 요소로 동기부여를 강화합니다.

---

## Key Features

### 교사(Teacher)
- 반 생성 및 관리(여러 반 운영)
- 학생 목록 조회
- 퀘스트 등록 및 운영(개인 퀘스트 / 단체 퀘스트)
- 학생 제출 퀘스트 승인 및 피드백 작성
- 레이드 등록 및 진행 현황 관리
- AI 보상 추천(학생별 맞춤 보상 추천)

### 학생(Student)
- 대시보드에서 공지/이벤트, 레이드/단체퀘스트 현황, 보유 재화, 시스템 로그 확인
- 퀘스트 확인 및 제출(상태 배지: 제출 필요 / 승인 대기중)
- 보상 재화로 가챠 진행, 수족관/도감 수집
- 탐사 데이터로 레이드 보스 공격 및 로그 확인(공격량 기준 정렬)

---

## Role-based Flow
회원가입 및 로그인 시 교사/학생 중 하나의 역할을 선택합니다.

---

## Screenshots

### 공통 화면(Common)

| 로그인(Login) | 회원가입(Sign Up) |
| --- | --- |
| <img src="https://github.com/user-attachments/assets/a22b4851-e5b5-42c3-9121-f7ca3da9ddfa" width="420" /> | <img src="https://github.com/user-attachments/assets/c7615d14-0bb8-4bf9-bac0-69e73e07ebf1" width="420" /> |

---

### 교사 화면(Teacher)

#### 교사 대시보드 / 반 생성
교사는 여러 개의 반을 생성하고 관리할 수 있습니다.

| 교사 대시보드 | 교사 반 생성 |
| --- | --- |
| <img src="https://github.com/user-attachments/assets/44fa6030-4fac-4902-a194-e0be47e5c4e3" width="520" /> | <img src="https://github.com/user-attachments/assets/fc58531e-9cce-4b1f-a67d-e20744aacde7" width="520" /> |

#### 반 관리
각 반 관리 화면에서는 학생 목록 조회, 퀘스트 등록, 레이드 등록, 진행 중인 단체퀘스트와 레이드 현황을 확인할 수 있습니다.

<img src="https://github.com/user-attachments/assets/ffe6b0fb-550c-4868-84d7-efe06a86012f" width="920" />

---

#### 퀘스트 등록 및 관리

##### 퀘스트 유형 선택(개인 퀘스트 / 단체 퀘스트)
교사는 퀘스트 등록에서 개인퀘스트, 단체퀘스트 중 하나를 선택합니다.

<img src="https://github.com/user-attachments/assets/af94d84d-f39d-4c3b-b568-8b38d9f9eb8a" width="920" />

##### 개인 퀘스트 등록
개별 학생을 선택해 학생 개인에게 맞는 퀘스트를 부여합니다.

| 개인 퀘스트 등록 | 개인 퀘스트 등록 |
| --- | --- |
| <img src="https://github.com/user-attachments/assets/f34293da-da49-46eb-8200-d53e39775052" width="520" /> | <img src="https://github.com/user-attachments/assets/92b64bd0-dc65-438f-8870-a9ae4df3bf4c" width="520" /> |

##### AI 보상 추천(개인 퀘스트)
퀘스트 등록 시 AI 보상 추천 기능을 통해 하나의 퀘스트에 대해 학생 개개인에게 맞춰진 보상을 추천받을 수 있습니다.

| AI 보상 추천 | AI 보상 추천 |
| --- | --- |
| <img src="https://github.com/user-attachments/assets/195c0ea4-75c5-4abb-b75e-972ef5082b1a" width="520" /> | <img src="https://github.com/user-attachments/assets/d2f75a6d-95c9-4f59-a8d7-f67de08fe439" width="520" /> |

##### 퀘스트 승인 및 피드백
학생이 완료하여 제출한 퀘스트는 학생 상세 조회 또는 퀘스트 승인 목록에서 확인할 수 있습니다. 학생의 성취를 확인하고 피드백을 작성합니다.

| 퀘스트 승인 | 퀘스트 승인 |
| --- | --- |
| <img src="https://github.com/user-attachments/assets/1173b139-bfcb-4633-82e4-7820e06136d7" width="520" /> | <img src="https://github.com/user-attachments/assets/0569b21b-1bba-4653-a900-37e5b9506e61" width="520" /> |

##### 단체 퀘스트 등록
단체 퀘스트 등록으로 학급 전체에 공동 목표를 부여합니다. 단체 퀘스트는 학습 과제의 특성이 강한 개인 퀘스트와 달리 출석 체크, 수업 참여 등 학생의 행동 교정과 학급 분위기 개선을 목표로 합니다.

---

#### 레이드 등록 및 관리
중간고사, 기말고사 등 학급의 집중적인 학습 성과가 필요한 경우 레이드를 등록할 수 있습니다.

| 레이드 등록 | 레이드 관리 |
| --- | --- |
| <img src="https://github.com/user-attachments/assets/91608f8d-3e3a-4c8f-a2af-0b553fcdace0" width="520" /> | <img src="https://github.com/user-attachments/assets/c6aa0b8f-d6db-49b7-ae73-2b66d4c5e79b" width="520" /> |

보스의 HP는 기본적으로 아래 수식으로 정해지며, 교사가 학급 상황에 맞춰 수정할 수 있습니다.  
- HP = 학생 수 × 레이드 기간(일) × 일일 기준 탐사데이터 × 난이도 계수

레이드의 경우 퀘스트와 다르게 특별 보상을 설정할 수 있습니다. 특별 보상은 SCA 플랫폼 외적인 오프라인 보상으로 줄 수 있습니다.

| 특별 보상 설정 | 레이드 화면 |
| --- | --- |
| <img src="https://github.com/user-attachments/assets/b19cae85-eda3-4298-8a60-9017043149a2" width="520" /> | <img src="https://github.com/user-attachments/assets/56c7854d-2460-4159-bf7f-d33550776a00" width="520" /> |

---

### 학생 화면(Student)

#### 학생 대시보드
학생은 대시보드에서 이벤트&공지, 레이드 현황, 단체퀘스트 현황, 보유 재화, 시스템 로그 등을 확인합니다.

| 학생 대시보드 | 학생 대시보드 |
| --- | --- |
| <img src="https://github.com/user-attachments/assets/43e4b0d0-d8f6-405f-b814-421235565277" width="420" /> | <img src="https://github.com/user-attachments/assets/f16d2343-1ad4-426c-a9f3-88366aa4ec0a" width="420" /> |

---

#### 퀘스트 확인 및 제출
학생은 퀘스트 메뉴에서 현재 주어진 퀘스트를 확인하고 제출합니다. 퀘스트 상태에 따라 '제출 필요', '승인 대기중' 뱃지가 표시됩니다.

| 퀘스트 확인 | 퀘스트 제출 |
| --- | --- |
| <img src="https://github.com/user-attachments/assets/32c52666-6d30-4444-8471-3b18fad7d1c4" width="420" /> | <img src="https://github.com/user-attachments/assets/00180d0d-9e03-4eee-9589-e48143e7551d" width="420" /> |

만료된 퀘스트, 완료된 퀘스트 항목에서 지난 퀘스트를 확인할 수 있습니다. 완료된 퀘스트의 코멘트를 클릭하면 선생님의 코멘트와 피드백을 확인할 수 있습니다.

| 만료/완료 퀘스트 | 피드백 확인 |
| --- | --- |
| <img src="https://github.com/user-attachments/assets/3fc81bf1-5192-4127-8a49-726cd9beb0aa" width="420" /> | <img src="https://github.com/user-attachments/assets/844850c7-ea16-4775-a590-df3b1eb352fc" width="420" /> |

---

#### 가챠 및 도감
퀘스트로 받은 보상 중 코랄을 이용해 가챠를 할 수 있습니다. 가챠로 뽑을 수 있는 물고기의 등급은 커먼/레어/레전더리로 구성됩니다.

| 가챠 | 가챠 결과 | 가챠 상세 |
| --- | --- | --- |
| <img src="https://github.com/user-attachments/assets/eec1ae3b-8122-41c0-bcb2-eb286fac4e98" width="260" /> | <img src="https://github.com/user-attachments/assets/e547f9da-a872-4c5e-8b5d-75dbb10132e1" width="260" /> | <img src="https://github.com/user-attachments/assets/63e1edec-db7c-4be3-b0fb-cee84e310db1" width="260" /> |

가챠로 뽑은 물고기는 수족관과 도감에서 확인 가능합니다. 중복된 물고기는 보유수량으로 추가하며, 아직 뽑지 못한 물고기도 도감에 노출하여 수집 욕구를 자극합니다.

| 수족관 | 도감 | 도감 상세 |
| --- | --- | --- |
| <img src="https://github.com/user-attachments/assets/bc55bf39-0378-414a-93e5-68a76bba9597" width="260" /> | <img src="https://github.com/user-attachments/assets/ba35038a-4203-49c1-8127-948c2de3566d" width="260" /> | <img src="https://github.com/user-attachments/assets/4a05d763-7382-4472-b7da-5071bb5d9eec" width="260" /> |

---

#### 레이드
퀘스트로 받은 보상 중 탐사 데이터를 이용해 레이드 보스를 공격합니다. 다른 학생들이 공격한 레이드 로그를 확인할 수 있으며, 로그는 총 공격량이 많은 학생 순으로 정렬됩니다. 협동 게임 구조를 유지하면서도 승부욕을 자극하는 요소를 포함했습니다.

| 레이드 | 레이드 공격 | 레이드 로그 |
| --- | --- | --- |
| <img src="https://github.com/user-attachments/assets/bcf6b256-5c6b-4c40-acbc-6e54eb9a75de" width="260" /> | <img src="https://github.com/user-attachments/assets/2cc15163-484b-461d-a7b0-c1b650784bac" width="260" /> | <img src="https://github.com/user-attachments/assets/eebf6042-027c-44d8-8218-d7772d6f1992" width="260" /> |

---
## Contributions

### Infrastructure / Deployment (Troubleshooting & Stabilization)
배포 실패를 단순 복구가 아니라 재현 가능한 빌드, 자동화된 배포, 운영 검증, 재발 방지(변수화/체크리스트)로 구조화하여 안정화했습니다.

- EC2 Docker 빌드에서 JAR 누락으로 COPY 실패
  - 조치: Dockerfile을 멀티스테이지 빌드로 전환하여 컨테이너 내부에서 Gradle 빌드 수행, `build/libs/*.jar` 다중 산출물에도 안전하도록 보완
  - 성과: 호스트 선빌드 의존 제거, 배포 재현성 확보  
  - Reference: commits `a50c076`, `bff33a5`, `30858d1` / `DEPLOY-EC2-FIXED.md`

- Docker 빌드 실패가 캐시/잔여 리소스 영향으로 반복 발생
  - 조치: 캐시 제거 및 환경 정리 절차를 표준 루틴으로 고정(`--no-cache`, orphan 제거, system prune)
  - 성과: “재시도”가 아니라 “절차”로 실패를 제거하는 운영 습관 정착  
  - Commands: `docker compose build --no-cache`, `docker compose down --remove-orphans`, `docker system prune -a --volumes -f`

- MySQL 연결 실패 원인 추측 반복
  - 조치: 컨테이너 상태 → 네트워크 → 로그 → 외부 DB 설정(DB_URL/계정/권한) 순으로 점검 플로우 정리
  - 성과: 운영 환경에서 재현 가능한 체크리스트로 장애 대응 체계화  
  - Tools: `docker network inspect`, `docker logs`, SG/Firewall 점검

- `ddl-auto: validate`에서 스키마 미존재로 부팅 실패
  - 조치: validate 모드는 테이블 선생성이 전제임을 문서화, `schema.sql` 적용 여부 및 `SHOW TABLES;`로 검증 절차 고정
  - 성과: 환경/초기화 상태에 따라 달라지는 장애를 “명시적 전제 + 검증”으로 통제

- Jenkins 파이프라인 실패(권한/도커/포트)
  - 조치: Console Output 기반 원인 확인 + 실행권한, Docker 데몬 접근권한, 컨테이너/포트 상태 점검 루틴 정리
  - 성과: 배포 실패 시 `down → up -d` 및 컨테이너 재시작으로 즉시 복구 가능한 흐름 확보

- 헬스체크 포트 불일치(8080 vs 8081)로 “정상인데 실패” 발생
  - 조치: Compose 외부 노출 포트와 헬스체크 호출 포트 불일치 진단, URL/검증을 `${BACKEND_PORT}` 등 변수 기반으로 단일화
  - 성과: 하드코딩 제거, 배포/검증/메시지의 단일 변수 세트 동기화

- 운영에서 프론트 요청이 `localhost`로 호출되어 Load failed 발생
  - 조치: Vite의 API URL이 빌드타임에 고정되는 점을 근거로 Jenkins 빌드 단계에서 `VITE_API_BASE_URL` 주입
  - 성과: 배포 환경에 따른 실패를 CI 단계에서 선제 차단, 빌드 로그로 실제 URL 검증 가능  
  - Reference: `PRODUCTION_API_URL_FIX.md`, `API_URL_SETUP_EXPLANATION.md`

- 프록시/경로 불일치(`/api/api`, WebSocket 101 실패)
  - 조치: FE URL 조합 규칙과 Nginx 프록시(/api, /ws) 규칙 정렬, Upgrade/Connection 헤더 명시
  - 성과: 실시간 기능까지 포함한 운영 경로 안정화, 배포 후 `curl`/브라우저 네트워크 탭 기반 스모크 테스트 절차 고정

---

### Frontend Architecture (Component Design)
화면 조립이 아니라 책임 단위 모듈 설계, 상태 전이 통제, 계약 기반 인터페이스를 중심으로 컴포넌트를 개발했습니다.

- Responsibility-based 분리
  - Feature/Page 책임: 학생/교사 도메인별 페이지 분리
  - Action 책임: 생성/관리/승인/조회 유스케이스 기준 분리
  - Presentation 책임: 재사용 UI는 `components/ui`로 격리
  - Cross-cutting: 라우팅/컨텍스트/API는 전용 레이어로 분리

- Directory를 Boundary로 사용(레이어드 아키텍처 관점)
  - `components/ui`: Presentational primitives(표현 전용)
  - `components/student`, `components/teacher`: 유스케이스 조합(애플리케이션 레벨)
  - `utils/api.ts`: 인프라 어댑터(API 호출)
  - `contexts/AppContext.tsx`: 도메인 상태 허브
  - `routes/AppRoutes.tsx`: 정책 라우터/진입점

- Contract-first 개발 프로세스
  - 구현 전에 props/이벤트/callback/상태 소유권을 먼저 고정
  - 페이지(유스케이스 조합)와 UI(표현/상호작용)를 분리하여 결합도 감소
  - 외부 의존(API/라우팅/전역상태)은 상위 레이어에서 주입하여 UI 컴포넌트 독립성 유지

---

### Backend Module (Raid)
게이미피케이션 서비스의 레이드(협동 보스전) 백엔드 모듈을 End-to-End로 설계 및 구현했습니다.

- Domain & Lifecycle
  - 상태 전이 모델링: `ACTIVE`, `COMPLETED`, `EXPIRED`, `TERMINATED`
  - 도메인 메서드 중심 설계: 문자열 제어가 아닌 엔티티 내부 상태 변경 메서드로 일관성 확보

- Data Model
  - `Raid`: 레이드 수명주기 및 보스 HP 관리
  - `Contribution`: (raid_id, student_id) 유니크 제약으로 중복 참여/누적 충돌 방지, 데미지 누적 메서드로 안전한 업데이트
  - `RaidLog`: 공격/자원/잔여 HP/타입 기록, 페이징 조회 지원(감사/히스토리)

- Business Logic
  - 원자적 공격 처리: 자원 차감 → HP 반영 → 기여도 업데이트 → 로그 적재까지 단일 트랜잭션으로 처리하여 부분 실패 제거
  - 권한 정책: RBAC 기반으로 교사(개설/종료/조회)와 학생(조회/공격) API 경계 분리
  - 만료 처리: 별도 스케줄러 없이 조회 시점에 만료 판단 후 `EXPIRED`로 전환하는 Lazy 정합성 전략 적용

- Realtime (WebSocket)
  - 레이드 단위 룸 기반 세션 관리(ConcurrentHashMap), 실시간 로그 브로드캐스트로 몰입감 강화
  - 잘못된 경로 접근 즉시 종료, 송신 실패 시 로깅을 통한 가용성 확보

- Operational Stability
  - `CustomException` + `ErrorCode` 체계로 권한/자원/상태 불일치 등 실패 케이스를 명확히 표준화
  - 동시성 경합(HP 갱신, 보상 중복 등) 시나리오를 인지하고 유니크 제약/하한 보정/트랜잭션 일관성으로 방어
  - 향후 개선 로드맵: 낙관적 락(@Version), 비관적 락, 원자적 업데이트 쿼리 도입 검토
