Return-Path: <linux-mips+bounces-9477-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 682ABAE77D4
	for <lists+linux-mips@lfdr.de>; Wed, 25 Jun 2025 09:10:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 519FE3BED6D
	for <lists+linux-mips@lfdr.de>; Wed, 25 Jun 2025 07:10:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3FCDA1FE47B;
	Wed, 25 Jun 2025 07:10:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="grOdLOtZ"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 081E11E9B23;
	Wed, 25 Jun 2025 07:10:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750835428; cv=none; b=U/OAcjxnXgX0XOsDIHQCdDzbpBY6byFqF2VM/HreP3wf/MEFqQ7fLuUcB+OHC3ZhKfWsIQw4VJiL5bbl7cyI4kNeXOuciHiWiaZu3ZPNodWMKVhbOF7cFPZ99WCJeuQlYA1dCMNBXqbKz8OfotEco8h28vhu6cWbY966HTZucvA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750835428; c=relaxed/simple;
	bh=oP/HTNYTl9LXpDk4PHssqzdxrIaWg9Dc4X7a2efoHe0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SsklcGxccVgPvwNBrZyalSzG1jtlvLDsHQJ1pFERtcVO6ydXQtx+QZbgoLjRxZMqW8GARkI5o+AMfbFvcnQFC9PY1zdPpJj0Si5u/JzDoi3UfphlpPNTk05lxWASi5VnRhQ9MxtQ81WsHNUHH2cj/mezDH6t13d2g6kU6zZSWmg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=grOdLOtZ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3DC29C4AF09;
	Wed, 25 Jun 2025 07:10:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750835427;
	bh=oP/HTNYTl9LXpDk4PHssqzdxrIaWg9Dc4X7a2efoHe0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=grOdLOtZgoIKmEWCLoLH/9c0vB0aNmsNV3SxcH0BZP5ljLtkHnx2+AKoNSsaq9vrv
	 DUs8v9tEITVzaIhBG2hZl5pFHjoAU65Vwvo8XLLJNUhLYdlK9SUpvu0gRKUh3lVnmx
	 xe7B9ojnICi0YfGfAQLPYVUBhPYUYbz115fGEy9isHKdHCYMvqY4oW6SNKWv4FJRs2
	 WjGEQ1c2vJ3eCDQIKmq8N+TBXe4uIfevRVsKQTU4aigzoOA6WXabW0iVDnRucYJXPc
	 sldN4RMVz138oOya4ugf0A3vVhvZXhzWJ6hACVLHuujYIZAQvxI5l26FaziMpipYfV
	 E4hbrlgSnTpIg==
From: Eric Biggers <ebiggers@kernel.org>
To: linux-crypto@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Ard Biesheuvel <ardb@kernel.org>,
	"Jason A . Donenfeld" <Jason@zx2c4.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mips@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org,
	sparclinux@vger.kernel.org,
	x86@kernel.org,
	Eric Biggers <ebiggers@kernel.org>
Subject: [PATCH 01/18] libceph: Rename hmac_sha256() to ceph_hmac_sha256()
Date: Wed, 25 Jun 2025 00:08:02 -0700
Message-ID: <20250625070819.1496119-2-ebiggers@kernel.org>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250625070819.1496119-1-ebiggers@kernel.org>
References: <20250625070819.1496119-1-ebiggers@kernel.org>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Rename hmac_sha256() to ceph_hmac_sha256(), to avoid a naming conflict
with the upcoming hmac_sha256() library function.

This code will be able to use the HMAC-SHA256 library, but that's left
for a later commit.

Signed-off-by: Eric Biggers <ebiggers@kernel.org>
---
 net/ceph/messenger_v2.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/net/ceph/messenger_v2.c b/net/ceph/messenger_v2.c
index bd608ffa06279..5483b4eed94e1 100644
--- a/net/ceph/messenger_v2.c
+++ b/net/ceph/messenger_v2.c
@@ -791,12 +791,12 @@ static int setup_crypto(struct ceph_connection *con,
 	       con_secret + CEPH_GCM_KEY_LEN + CEPH_GCM_IV_LEN,
 	       CEPH_GCM_IV_LEN);
 	return 0;  /* auth_x, secure mode */
 }
 
-static int hmac_sha256(struct ceph_connection *con, const struct kvec *kvecs,
-		       int kvec_cnt, u8 *hmac)
+static int ceph_hmac_sha256(struct ceph_connection *con,
+			    const struct kvec *kvecs, int kvec_cnt, u8 *hmac)
 {
 	SHASH_DESC_ON_STACK(desc, con->v2.hmac_tfm);  /* tfm arg is ignored */
 	int ret;
 	int i;
 
@@ -1460,12 +1460,12 @@ static int prepare_auth_signature(struct ceph_connection *con)
 	buf = alloc_conn_buf(con, head_onwire_len(SHA256_DIGEST_SIZE,
 						  con_secure(con)));
 	if (!buf)
 		return -ENOMEM;
 
-	ret = hmac_sha256(con, con->v2.in_sign_kvecs, con->v2.in_sign_kvec_cnt,
-			  CTRL_BODY(buf));
+	ret = ceph_hmac_sha256(con, con->v2.in_sign_kvecs,
+			       con->v2.in_sign_kvec_cnt, CTRL_BODY(buf));
 	if (ret)
 		return ret;
 
 	return prepare_control(con, FRAME_TAG_AUTH_SIGNATURE, buf,
 			       SHA256_DIGEST_SIZE);
@@ -2458,12 +2458,12 @@ static int process_auth_signature(struct ceph_connection *con,
 	if (con->state != CEPH_CON_S_V2_AUTH_SIGNATURE) {
 		con->error_msg = "protocol error, unexpected auth_signature";
 		return -EINVAL;
 	}
 
-	ret = hmac_sha256(con, con->v2.out_sign_kvecs,
-			  con->v2.out_sign_kvec_cnt, hmac);
+	ret = ceph_hmac_sha256(con, con->v2.out_sign_kvecs,
+			       con->v2.out_sign_kvec_cnt, hmac);
 	if (ret)
 		return ret;
 
 	ceph_decode_need(&p, end, SHA256_DIGEST_SIZE, bad);
 	if (crypto_memneq(p, hmac, SHA256_DIGEST_SIZE)) {
-- 
2.50.0


