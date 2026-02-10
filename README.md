# SCA Platform

SCA Platform은 **교사와 학생이 함께 사용하는 학급 관리/동기부여 서비스**입니다.
교사는 퀘스트·레이드·학급 현황을 관리하고, 학생은 과제를 수행하며 보상 시스템(가챠/도감)을 통해 성취를 쌓을 수 있습니다.

---

## 목차

1. [공통 화면](#공통-화면)
2. [교사 화면](#교사-화면)
   - [교사 대시보드](#교사-대시보드)
   - [퀘스트 등록 및 관리](#퀘스트-등록-및-관리)
   - [레이드 등록 및 관리](#레이드-등록-및-관리)
3. [학생 화면](#학생-화면)
   - [학생 대시보드](#학생-대시보드)
   - [퀘스트 확인 및 제출](#퀘스트-확인-및-제출)
   - [가챠 및 도감](#가챠-및-도감)
   - [레이드](#레이드)

---

## 공통 화면

### 로그인 / 회원가입

사용자는 회원가입 및 로그인 시 **교사/학생 역할 중 하나를 선택**합니다.

<img width="280" alt="로그인 화면" src="https://github.com/user-attachments/assets/a22b4851-e5b5-42c3-9121-f7ca3da9ddfa" />
<img width="280" alt="회원가입 화면" src="https://github.com/user-attachments/assets/c7615d14-0bb8-4bf9-bac0-69e73e07ebf1" />

---

## 교사 화면

<img width="280" alt="교사 화면 1" src="https://github.com/user-attachments/assets/44fa6030-4fac-4902-a194-e0be47e5c4e3" />
<img width="280" alt="교사 화면 2" src="https://github.com/user-attachments/assets/fc58531e-9cce-4b1f-a67d-e20744aacde7" />

### 교사 대시보드

교사는 여러 개의 반을 생성하고 관리할 수 있습니다.

<img width="280" alt="교사 반 생성" src="https://github.com/user-attachments/assets/ffe6b0fb-550c-4868-84d7-efe06a86012f" />

### 교사 반 관리

각 반 관리 화면에서 다음 기능을 사용할 수 있습니다.

- 학생 목록 조회
- 퀘스트 등록
- 레이드 등록
- 진행 중인 단체 퀘스트/레이드 현황 확인

### 퀘스트 등록 및 관리

<img width="280" alt="퀘스트 등록 화면 1" src="https://github.com/user-attachments/assets/9540c19b-e9a9-4233-b5fa-49fa8e39ca4e" />
<img width="280" alt="퀘스트 등록 화면 2" src="https://github.com/user-attachments/assets/6ed94d72-4f2c-4942-a891-3169c125c1bb" />

교사는 퀘스트 등록 시 **개인 퀘스트 / 단체 퀘스트** 중 하나를 선택합니다.

<img width="280" alt="퀘스트 종류 선택" src="https://github.com/user-attachments/assets/af94d84d-f39d-4c3b-b568-8b38d9f9eb8a" />

#### 개인 퀘스트

개별 학생을 선택해 학생 맞춤형 퀘스트를 부여할 수 있습니다.

<img width="280" alt="개인 퀘스트 등록 1" src="https://github.com/user-attachments/assets/f34293da-da49-46eb-8200-d53e39775052" />
<img width="280" alt="개인 퀘스트 등록 2" src="https://github.com/user-attachments/assets/92b64bd0-dc65-438f-8870-a9ae4df3bf4c" />

또한 **AI 보상 추천 기능**으로 하나의 퀘스트에 대해 학생별 맞춤 보상을 제안받을 수 있습니다.

<img width="280" alt="AI 보상 추천 1" src="https://github.com/user-attachments/assets/195c0ea4-75c5-4abb-b75e-972ef5082b1a" />
<img width="280" alt="AI 보상 추천 2" src="https://github.com/user-attachments/assets/d2f75a6d-95c9-4f59-a8d7-f67de08fe439" />

학생이 제출한 퀘스트는 학생 상세 화면 또는 승인 목록에서 확인할 수 있으며, 성취에 대한 피드백을 작성할 수 있습니다.

<img width="280" alt="퀘스트 승인 1" src="https://github.com/user-attachments/assets/1173b139-bfcb-4633-82e4-7820e06136d7" />
<img width="280" alt="퀘스트 승인 2" src="https://github.com/user-attachments/assets/0569b21b-1bba-4653-a900-37e5b9506e61" />

#### 단체 퀘스트

단체 퀘스트는 학급 전체에 공동 목표를 부여합니다.

- 출석 체크
- 수업 참여
- 학급 분위기 개선 등

개인 학습 과제 중심의 개인 퀘스트와 달리, 행동 습관 및 협동을 강조하는 목적에 적합합니다.

<img width="280" alt="단체 퀘스트 등록 1" src="https://github.com/user-attachments/assets/91608f8d-3e3a-4c8f-a2af-0b553fcdace0" />
<img width="280" alt="단체 퀘스트 등록 2" src="https://github.com/user-attachments/assets/c6aa0b8f-d6db-49b7-ae73-2b66d4c5e79b" />

### 레이드 등록 및 관리

중간고사/기말고사처럼 학급의 집중 학습이 필요한 기간에는 레이드를 등록할 수 있습니다.

- 보스 HP 기본식: `학생 수 × 레이드 기간(일) × 일일 기준 탐사 데이터 × 난이도 계수`
- 교사는 학급 상황에 맞게 HP를 자유롭게 조정 가능

<img width="280" alt="레이드 등록 1" src="https://github.com/user-attachments/assets/b19cae85-eda3-4298-8a60-9017043149a2" />
<img width="280" alt="레이드 등록 2" src="https://github.com/user-attachments/assets/56c7854d-2460-4159-bf7f-d33550776a00" />

레이드는 퀘스트와 달리 **특별 보상(오프라인 보상)**을 설정할 수 있습니다.

---

## 학생 화면

### 학생 대시보드

학생은 대시보드에서 다음 정보를 확인할 수 있습니다.

- 이벤트 & 공지
- 레이드 현황
- 단체 퀘스트 현황
- 보유 재화
- 시스템 로그

<img width="280" alt="학생 대시보드 1" src="https://github.com/user-attachments/assets/43e4b0d0-d8f6-405f-b814-421235565277" />
<img width="280" alt="학생 대시보드 2" src="https://github.com/user-attachments/assets/f16d2343-1ad4-426c-a9f3-88366aa4ec0a" />

### 퀘스트 확인 및 제출

학생은 퀘스트 메뉴에서 현재 할당된 과제를 확인하고 제출합니다.

- `제출 필요`
- `승인 대기중`

상태에 따라 퀘스트 뱃지가 달라집니다.

<img width="280" alt="학생 퀘스트 1" src="https://github.com/user-attachments/assets/32c52666-6d30-4444-8471-3b18fad7d1c4" />
<img width="280" alt="학생 퀘스트 2" src="https://github.com/user-attachments/assets/00180d0d-9e03-4eee-9589-e48143e7551d" />

만료/완료 탭에서 지난 퀘스트를 확인할 수 있고, 완료 퀘스트 코멘트에서 선생님 피드백을 볼 수 있습니다.

<img width="280" alt="학생 퀘스트 기록 1" src="https://github.com/user-attachments/assets/3fc81bf1-5192-4127-8a49-726cd9beb0aa" />
<img width="280" alt="학생 퀘스트 기록 2" src="https://github.com/user-attachments/assets/844850c7-ea16-4775-a590-df3b1eb352fc" />

### 가챠 및 도감

퀘스트 보상으로 얻은 **코랄**을 사용해 가챠를 진행할 수 있습니다.

- 물고기 등급: 커먼 / 레어 / 레전더리

<img width="280" alt="학생 가챠 1" src="https://github.com/user-attachments/assets/eec1ae3b-8122-41c0-bcb2-eb286fac4e98" />
<img width="280" alt="학생 가챠 2" src="https://github.com/user-attachments/assets/e547f9da-a872-4c5e-8b5d-75dbb10132e1" />
<img width="280" alt="학생 가챠 3" src="https://github.com/user-attachments/assets/63e1edec-db7c-4be3-b0fb-cee84e310db1" />

가챠로 획득한 물고기는 수족관/도감에서 확인할 수 있습니다.

- 중복 물고기: 보유 수량 누적
- 미획득 물고기: 도감에 노출되어 수집 동기 유발

<img width="280" alt="학생 도감 1" src="https://github.com/user-attachments/assets/bc55bf39-0378-414a-93e5-68a76bba9597" />
<img width="280" alt="학생 도감 2" src="https://github.com/user-attachments/assets/ba35038a-4203-49c1-8127-948c2de3566d" />
<img width="280" alt="학생 도감 3" src="https://github.com/user-attachments/assets/4a05d763-7382-4472-b7da-5071bb5d9eec" />

### 레이드

학생은 퀘스트 보상으로 받은 **탐사 데이터**를 사용해 레이드 보스를 공격합니다.

- 다른 학생의 공격 로그 확인 가능
- 로그는 누적 공격량 순으로 정렬
- 협동 플레이 기반 + 경쟁 요소를 통한 몰입 강화

<img width="280" alt="학생 레이드 1" src="https://github.com/user-attachments/assets/bcf6b256-5c6b-4c40-acbc-6e54eb9a75de" />
<img width="280" alt="학생 레이드 2" src="https://github.com/user-attachments/assets/2cc15163-484b-461d-a7b0-c1b650784bac" />
<img width="280" alt="학생 레이드 3" src="https://github.com/user-attachments/assets/eebf6042-027c-44d8-8218-d7772d6f1992" />
