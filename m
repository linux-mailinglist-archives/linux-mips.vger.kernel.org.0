Return-Path: <linux-mips+bounces-9570-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A78A2AEE3CA
	for <lists+linux-mips@lfdr.de>; Mon, 30 Jun 2025 18:13:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BD0273A1F6D
	for <lists+linux-mips@lfdr.de>; Mon, 30 Jun 2025 16:10:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9473229827B;
	Mon, 30 Jun 2025 16:09:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="i1sDTgEL"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 622C12980D4;
	Mon, 30 Jun 2025 16:09:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751299762; cv=none; b=j5TjvBJuOu6L25kFZzeETafXfQ2j67WUE/SiP1qlw18zv1xZPL28zBfm5RXKWlu47+lOAabSBhBbnuwMKwcRFODbbmvPwlLtqSZABFBZ8g9F5gYBPmL+Q7g2ntMpgoMJBdHzO0xeyqQAkOA05tLQ71N1watFIwcB607juudwg6U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751299762; c=relaxed/simple;
	bh=oP/HTNYTl9LXpDk4PHssqzdxrIaWg9Dc4X7a2efoHe0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KFEemeWFbxqr3G0UK61+l7g85QryTYSHiXEirUp8Wh5qCsHgInqluhUwfRwsWrfgjClFEg4OyxS69Sz9Iu8ll9p0BBCX8P1MFoseiW8jJjfLztpwVQKdhXJSxBDNtA6DikWvPCU2pGAiE6g6/YjvNCOMMKqwY+G2UMJ70hoIbug=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=i1sDTgEL; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9BAC1C4CEF1;
	Mon, 30 Jun 2025 16:09:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751299761;
	bh=oP/HTNYTl9LXpDk4PHssqzdxrIaWg9Dc4X7a2efoHe0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=i1sDTgELYRSRNAFZVOP1NxIWH+kNYmHvowh3XGVDACcMSCP75QQyHveAF+wOTzgst
	 bFgOJEykz/D+oYZczddK0gK0qHnZKTS3SdS+6yNsW99rAfIg7ExwcjIc629lG8uUzP
	 6RXbIgB0Lnq7FEpxdAwuJhnZsIxN1JnlOiPjIAhce93Tzmp0yCX5ze/tBjdO9hEM93
	 5It48cSTjDq/iAFNIdf91pghNIg9JiVU9THkutS5boFEIvhgmKf0YpmHF2ztLN5r8o
	 j+IAjk5UtyQtYisGd3wBItTS2GoyKfYlW/lLBDrXq+RrsTLZZMh9UJ5AHTpPPhc3H7
	 WnO7/m1FYmYwA==
From: Eric Biggers <ebiggers@kernel.org>
To: linux-crypto@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mips@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org,
	sparclinux@vger.kernel.org,
	x86@kernel.org,
	Ard Biesheuvel <ardb@kernel.org>,
	"Jason A . Donenfeld" <Jason@zx2c4.com>,
	Eric Biggers <ebiggers@kernel.org>
Subject: [PATCH v2 01/14] libceph: Rename hmac_sha256() to ceph_hmac_sha256()
Date: Mon, 30 Jun 2025 09:06:32 -0700
Message-ID: <20250630160645.3198-2-ebiggers@kernel.org>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250630160645.3198-1-ebiggers@kernel.org>
References: <20250630160645.3198-1-ebiggers@kernel.org>
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


