-- ============================================
-- 모든 물고기를 Student 4 (Hong Gildong) 컬렉션에 추가
-- 새로운 물고기 이름 순서에 맞춘 버전
-- ============================================
-- 사용 방법:
-- 1. H2 Console 접속: http://localhost:8080/h2-console
-- 2. JDBC URL: jdbc:h2:file:./data/devdb
-- 3. Username: sa
-- 4. Password: (비워두기)
-- 5. 이 SQL을 복사하여 실행
-- ============================================

-- 기존 컬렉션 엔트리 삭제 (선택사항)
DELETE FROM collection_entries WHERE collection_id = 1;

-- 모든 물고기를 컬렉션에 추가
-- Student 4 (Hong Gildong)의 collection_id는 1입니다.

-- COMMON 등급 물고기 (fish_id 1~7)
INSERT INTO collection_entries (collection_id, fish_id, fish_count) VALUES
(1, 1, 1),  -- 해파리
(1, 2, 1),  -- 열대어
(1, 3, 1),  -- 해마
(1, 4, 1),  -- 복어
(1, 5, 1),  -- 구피
(1, 6, 1),  -- 금붕어
(1, 7, 1);  -- 흰동가리

-- RARE 등급 물고기 (fish_id 8~11)
INSERT INTO collection_entries (collection_id, fish_id, fish_count) VALUES
(1, 8, 1),  -- 바다거북
(1, 9, 1),  -- 문어
(1, 10, 1), -- 상어
(1, 11, 1); -- 전기뱀장어

-- LEGENDARY 등급 물고기 (fish_id 12~13)
INSERT INTO collection_entries (collection_id, fish_id, fish_count) VALUES
(1, 12, 1), -- 바다해룡
(1, 13, 1); -- 리바이어던

-- ============================================
-- 확인 쿼리 (실행 후 확인용)
-- ============================================
-- SELECT ce.entry_id, ce.fish_id, ce.fish_count, f.fish_name, f.grade 
-- FROM collection_entries ce
-- JOIN fish f ON ce.fish_id = f.fish_id
-- WHERE ce.collection_id = 1
-- ORDER BY f.grade, f.fish_id;

