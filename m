Return-Path: <linux-mips+bounces-9782-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 931E8B02E04
	for <lists+linux-mips@lfdr.de>; Sun, 13 Jul 2025 01:30:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CBA8EA46D7F
	for <lists+linux-mips@lfdr.de>; Sat, 12 Jul 2025 23:28:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A32E923F417;
	Sat, 12 Jul 2025 23:26:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mxUS8aLD"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65B4F23E355;
	Sat, 12 Jul 2025 23:26:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752362788; cv=none; b=jsx62hOSHqrX9w3n6IOiMqWudGerXHSPy49TOwaB/ppBPSuR87uHFgmDGwtVhXyhi7g/zQ2QP5gAh+/gFDF7Ep7p3aG5zg1NP96CjsRs5vccQQHRxHzoDu+8/9CT27yNOkFYPVB8Mc1rjq9JoHAFqaSXQQRbhBgf47X6iIwuKSw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752362788; c=relaxed/simple;
	bh=KTb/kHlWd3wQdhu+ilLCvMKl6qovl3HZh1pimsnVPTg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BcbUj0110HX/JWSRIFmb4kfvSp0GZ4Y6BDvXbkQH6IUs4uUTq7eN9yabLnqJqmpP/NmUyBcqHqbbY2odmLiNaxPT9VOSj709O700BesOsTx9bENC3Zk+ldWqcnlLDxkKLxIkpgEjLMUO7YIIi8+hiDzLmfm9AI0KlA22hxizoyk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mxUS8aLD; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EAF27C4CEF8;
	Sat, 12 Jul 2025 23:26:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752362788;
	bh=KTb/kHlWd3wQdhu+ilLCvMKl6qovl3HZh1pimsnVPTg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=mxUS8aLDzLz2lxZ7FY8YXhwan3picqBL4U0OESweinppoghCLFI2054GFQg+jkmnY
	 DdhCc8Q8jLcHHO7wsDr62KIh0C1HowwzStV/jMEpViJ+KMHH/y/G0DrdDEB0Rw5anz
	 DpqBniSkST9kWPQ8P997D4snILzkc1TorIdOr5tMqAoNKwi64MfNv59v41EkLBo9FT
	 xjZ+qOZTB3FscgyvkMngJyaQ93UKpSLhzCx7R3Dp+bPpl4MAdT5Vrptt7okpvbn13M
	 V7Jor9AXxyEcCNR6okV8WW/b6NR2rQzclvSIfn63GAwGHo5jykU+2Fx6C76eJZtcIN
	 vMk5dzFz9MGtw==
From: Eric Biggers <ebiggers@kernel.org>
To: linux-crypto@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Ard Biesheuvel <ardb@kernel.org>,
	"Jason A . Donenfeld" <Jason@zx2c4.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mips@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-s390@vger.kernel.org,
	sparclinux@vger.kernel.org,
	x86@kernel.org,
	Eric Biggers <ebiggers@kernel.org>
Subject: [PATCH 17/26] sctp: Use HMAC-SHA1 and HMAC-SHA256 library functions
Date: Sat, 12 Jul 2025 16:23:08 -0700
Message-ID: <20250712232329.818226-18-ebiggers@kernel.org>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250712232329.818226-1-ebiggers@kernel.org>
References: <20250712232329.818226-1-ebiggers@kernel.org>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

For SCTP authenticated chunks, use the HMAC-SHA1 and HMAC-SHA256 library
functions instead of crypto_shash.  This is simpler and faster.

Signed-off-by: Eric Biggers <ebiggers@kernel.org>
---
 include/net/sctp/auth.h      |  12 +--
 include/net/sctp/constants.h |   2 -
 include/net/sctp/structs.h   |   5 --
 net/sctp/Kconfig             |  15 ++--
 net/sctp/auth.c              | 153 +++++------------------------------
 net/sctp/socket.c            |  10 ---
 6 files changed, 32 insertions(+), 165 deletions(-)

diff --git a/include/net/sctp/auth.h b/include/net/sctp/auth.h
index d4b3b2dcd15b7..02e13e126ceb7 100644
--- a/include/net/sctp/auth.h
+++ b/include/net/sctp/auth.h
@@ -20,20 +20,15 @@
 
 struct sctp_endpoint;
 struct sctp_association;
 struct sctp_authkey;
 struct sctp_hmacalgo;
-struct crypto_shash;
 
-/*
- * Define a generic struct that will hold all the info
- * necessary for an HMAC transform
- */
+/* Defines an HMAC algorithm supported by SCTP-AUTH */
 struct sctp_hmac {
-	__u16 hmac_id;		/* one of the above ids */
-	char *hmac_name;	/* name for loading */
-	__u16 hmac_len;		/* length of the signature */
+	__u16 hmac_id;		/* one of SCTP_AUTH_HMAC_ID_* */
+	__u16 hmac_len;		/* length of the HMAC signature in bytes */
 };
 
 /* This is generic structure that containst authentication bytes used
  * as keying material.  It's a what is referred to as byte-vector all
  * over SCTP-AUTH
@@ -76,11 +71,10 @@ struct sctp_shared_key *sctp_auth_get_shkey(
 				__u16 key_id);
 int sctp_auth_asoc_copy_shkeys(const struct sctp_endpoint *ep,
 				struct sctp_association *asoc,
 				gfp_t gfp);
 int sctp_auth_init_hmacs(struct sctp_endpoint *ep, gfp_t gfp);
-void sctp_auth_destroy_hmacs(struct crypto_shash *auth_hmacs[]);
 struct sctp_hmac *sctp_auth_get_hmac(__u16 hmac_id);
 struct sctp_hmac *sctp_auth_asoc_get_hmac(const struct sctp_association *asoc);
 void sctp_auth_asoc_set_default_hmac(struct sctp_association *asoc,
 				     struct sctp_hmac_algo_param *hmacs);
 int sctp_auth_asoc_verify_hmac_id(const struct sctp_association *asoc,
diff --git a/include/net/sctp/constants.h b/include/net/sctp/constants.h
index 5859e0a16a584..81dde3c3e6a58 100644
--- a/include/net/sctp/constants.h
+++ b/include/net/sctp/constants.h
@@ -415,13 +415,11 @@ enum sctp_lower_cwnd {
  */
 enum {
 	SCTP_AUTH_HMAC_ID_RESERVED_0,
 	SCTP_AUTH_HMAC_ID_SHA1,
 	SCTP_AUTH_HMAC_ID_RESERVED_2,
-#if defined (CONFIG_CRYPTO_SHA256) || defined (CONFIG_CRYPTO_SHA256_MODULE)
 	SCTP_AUTH_HMAC_ID_SHA256,
-#endif
 	__SCTP_AUTH_HMAC_MAX
 };
 
 #define SCTP_AUTH_HMAC_ID_MAX	__SCTP_AUTH_HMAC_MAX - 1
 #define SCTP_AUTH_NUM_HMACS 	__SCTP_AUTH_HMAC_MAX
diff --git a/include/net/sctp/structs.h b/include/net/sctp/structs.h
index 1ad7ce71d0a78..1de69a236754f 100644
--- a/include/net/sctp/structs.h
+++ b/include/net/sctp/structs.h
@@ -1327,15 +1327,10 @@ struct sctp_endpoint {
 	__u32 sndbuf_policy;
 
 	/* rcvbuf acct. policy.	*/
 	__u32 rcvbuf_policy;
 
-	/* SCTP AUTH: array of the HMACs that will be allocated
-	 * we need this per association so that we don't serialize
-	 */
-	struct crypto_shash **auth_hmacs;
-
 	/* SCTP-AUTH: hmacs for the endpoint encoded into parameter */
 	 struct sctp_hmac_algo_param *auth_hmacs_list;
 
 	/* SCTP-AUTH: chunks to authenticate encoded into parameter */
 	struct sctp_chunks_param *auth_chunk_list;
diff --git a/net/sctp/Kconfig b/net/sctp/Kconfig
index 24d5a35ce894a..192027555b4d8 100644
--- a/net/sctp/Kconfig
+++ b/net/sctp/Kconfig
@@ -5,13 +5,12 @@
 
 menuconfig IP_SCTP
 	tristate "The SCTP Protocol"
 	depends on INET
 	depends on IPV6 || IPV6=n
-	select CRYPTO
-	select CRYPTO_HMAC
-	select CRYPTO_SHA1
+	select CRYPTO_LIB_SHA1
+	select CRYPTO_LIB_SHA256
 	select NET_CRC32C
 	select NET_UDP_TUNNEL
 	help
 	  Stream Control Transmission Protocol
 
@@ -77,19 +76,21 @@ endchoice
 
 config SCTP_COOKIE_HMAC_MD5
 	bool "Enable optional MD5 hmac cookie generation"
 	help
 	  Enable optional MD5 hmac based SCTP cookie generation
-	select CRYPTO_HMAC if SCTP_COOKIE_HMAC_MD5
-	select CRYPTO_MD5 if SCTP_COOKIE_HMAC_MD5
+	select CRYPTO
+	select CRYPTO_HMAC
+	select CRYPTO_MD5
 
 config SCTP_COOKIE_HMAC_SHA1
 	bool "Enable optional SHA1 hmac cookie generation"
 	help
 	  Enable optional SHA1 hmac based SCTP cookie generation
-	select CRYPTO_HMAC if SCTP_COOKIE_HMAC_SHA1
-	select CRYPTO_SHA1 if SCTP_COOKIE_HMAC_SHA1
+	select CRYPTO
+	select CRYPTO_HMAC
+	select CRYPTO_SHA1
 
 config INET_SCTP_DIAG
 	depends on INET_DIAG
 	def_tristate INET_DIAG
 
diff --git a/net/sctp/auth.c b/net/sctp/auth.c
index c58fffc86a0c2..21d679a2ffb60 100644
--- a/net/sctp/auth.c
+++ b/net/sctp/auth.c
@@ -10,40 +10,41 @@
  *
  * Written or modified by:
  *   Vlad Yasevich     <vladislav.yasevich@hp.com>
  */
 
-#include <crypto/hash.h>
+#include <crypto/sha1.h>
+#include <crypto/sha2.h>
 #include <linux/slab.h>
 #include <linux/types.h>
-#include <linux/scatterlist.h>
 #include <net/sctp/sctp.h>
 #include <net/sctp/auth.h>
 
 static struct sctp_hmac sctp_hmac_list[SCTP_AUTH_NUM_HMACS] = {
 	{
 		/* id 0 is reserved.  as all 0 */
 		.hmac_id = SCTP_AUTH_HMAC_ID_RESERVED_0,
 	},
 	{
 		.hmac_id = SCTP_AUTH_HMAC_ID_SHA1,
-		.hmac_name = "hmac(sha1)",
 		.hmac_len = SCTP_SHA1_SIG_SIZE,
 	},
 	{
 		/* id 2 is reserved as well */
 		.hmac_id = SCTP_AUTH_HMAC_ID_RESERVED_2,
 	},
-#if IS_ENABLED(CONFIG_CRYPTO_SHA256)
 	{
 		.hmac_id = SCTP_AUTH_HMAC_ID_SHA256,
-		.hmac_name = "hmac(sha256)",
 		.hmac_len = SCTP_SHA256_SIG_SIZE,
 	}
-#endif
 };
 
+static bool sctp_hmac_supported(__u16 hmac_id)
+{
+	return hmac_id < ARRAY_SIZE(sctp_hmac_list) &&
+	       sctp_hmac_list[hmac_id].hmac_len != 0;
+}
 
 void sctp_auth_key_put(struct sctp_auth_bytes *key)
 {
 	if (!key)
 		return;
@@ -442,79 +443,10 @@ struct sctp_shared_key *sctp_auth_get_shkey(
 	}
 
 	return NULL;
 }
 
-/*
- * Initialize all the possible digest transforms that we can use.  Right
- * now, the supported digests are SHA1 and SHA256.  We do this here once
- * because of the restrictiong that transforms may only be allocated in
- * user context.  This forces us to pre-allocated all possible transforms
- * at the endpoint init time.
- */
-int sctp_auth_init_hmacs(struct sctp_endpoint *ep, gfp_t gfp)
-{
-	struct crypto_shash *tfm = NULL;
-	__u16   id;
-
-	/* If the transforms are already allocated, we are done */
-	if (ep->auth_hmacs)
-		return 0;
-
-	/* Allocated the array of pointers to transorms */
-	ep->auth_hmacs = kcalloc(SCTP_AUTH_NUM_HMACS,
-				 sizeof(struct crypto_shash *),
-				 gfp);
-	if (!ep->auth_hmacs)
-		return -ENOMEM;
-
-	for (id = 0; id < SCTP_AUTH_NUM_HMACS; id++) {
-
-		/* See is we support the id.  Supported IDs have name and
-		 * length fields set, so that we can allocated and use
-		 * them.  We can safely just check for name, for without the
-		 * name, we can't allocate the TFM.
-		 */
-		if (!sctp_hmac_list[id].hmac_name)
-			continue;
-
-		/* If this TFM has been allocated, we are all set */
-		if (ep->auth_hmacs[id])
-			continue;
-
-		/* Allocate the ID */
-		tfm = crypto_alloc_shash(sctp_hmac_list[id].hmac_name, 0, 0);
-		if (IS_ERR(tfm))
-			goto out_err;
-
-		ep->auth_hmacs[id] = tfm;
-	}
-
-	return 0;
-
-out_err:
-	/* Clean up any successful allocations */
-	sctp_auth_destroy_hmacs(ep->auth_hmacs);
-	ep->auth_hmacs = NULL;
-	return -ENOMEM;
-}
-
-/* Destroy the hmac tfm array */
-void sctp_auth_destroy_hmacs(struct crypto_shash *auth_hmacs[])
-{
-	int i;
-
-	if (!auth_hmacs)
-		return;
-
-	for (i = 0; i < SCTP_AUTH_NUM_HMACS; i++) {
-		crypto_free_shash(auth_hmacs[i]);
-	}
-	kfree(auth_hmacs);
-}
-
-
 struct sctp_hmac *sctp_auth_get_hmac(__u16 hmac_id)
 {
 	return &sctp_hmac_list[hmac_id];
 }
 
@@ -541,30 +473,14 @@ struct sctp_hmac *sctp_auth_asoc_get_hmac(const struct sctp_association *asoc)
 
 	n_elt = (ntohs(hmacs->param_hdr.length) -
 		 sizeof(struct sctp_paramhdr)) >> 1;
 	for (i = 0; i < n_elt; i++) {
 		id = ntohs(hmacs->hmac_ids[i]);
-
-		/* Check the id is in the supported range. And
-		 * see if we support the id.  Supported IDs have name and
-		 * length fields set, so that we can allocate and use
-		 * them.  We can safely just check for name, for without the
-		 * name, we can't allocate the TFM.
-		 */
-		if (id > SCTP_AUTH_HMAC_ID_MAX ||
-		    !sctp_hmac_list[id].hmac_name) {
-			id = 0;
-			continue;
-		}
-
-		break;
+		if (sctp_hmac_supported(id))
+			return &sctp_hmac_list[id];
 	}
-
-	if (id == 0)
-		return NULL;
-
-	return &sctp_hmac_list[id];
+	return NULL;
 }
 
 static int __sctp_auth_find_hmacid(__be16 *hmacs, int n_elts, __be16 hmac_id)
 {
 	int  found = 0;
@@ -604,31 +520,23 @@ int sctp_auth_asoc_verify_hmac_id(const struct sctp_association *asoc,
  *   algorithm it supports.
  */
 void sctp_auth_asoc_set_default_hmac(struct sctp_association *asoc,
 				     struct sctp_hmac_algo_param *hmacs)
 {
-	struct sctp_endpoint *ep;
 	__u16   id;
 	int	i;
 	int	n_params;
 
 	/* if the default id is already set, use it */
 	if (asoc->default_hmac_id)
 		return;
 
 	n_params = (ntohs(hmacs->param_hdr.length) -
 		    sizeof(struct sctp_paramhdr)) >> 1;
-	ep = asoc->ep;
 	for (i = 0; i < n_params; i++) {
 		id = ntohs(hmacs->hmac_ids[i]);
-
-		/* Check the id is in the supported range */
-		if (id > SCTP_AUTH_HMAC_ID_MAX)
-			continue;
-
-		/* If this TFM has been allocated, use this id */
-		if (ep->auth_hmacs[id]) {
+		if (sctp_hmac_supported(id)) {
 			asoc->default_hmac_id = id;
 			break;
 		}
 	}
 }
@@ -707,13 +615,12 @@ int sctp_auth_recv_cid(enum sctp_cid chunk, const struct sctp_association *asoc)
 void sctp_auth_calculate_hmac(const struct sctp_association *asoc,
 			      struct sk_buff *skb, struct sctp_auth_chunk *auth,
 			      struct sctp_shared_key *ep_key, gfp_t gfp)
 {
 	struct sctp_auth_bytes *asoc_key;
-	struct crypto_shash *tfm;
 	__u16 key_id, hmac_id;
-	unsigned char *end;
+	size_t data_len;
 	int free_key = 0;
 	__u8 *digest;
 
 	/* Extract the info we need:
 	 * - hmac id
@@ -731,23 +638,19 @@ void sctp_auth_calculate_hmac(const struct sctp_association *asoc,
 			return;
 
 		free_key = 1;
 	}
 
-	/* set up scatter list */
-	end = skb_tail_pointer(skb);
-
-	tfm = asoc->ep->auth_hmacs[hmac_id];
-
+	data_len = skb_tail_pointer(skb) - (u8 *)auth;
 	digest = (u8 *)(&auth->auth_hdr + 1);
-	if (crypto_shash_setkey(tfm, &asoc_key->data[0], asoc_key->len))
-		goto free;
-
-	crypto_shash_tfm_digest(tfm, (u8 *)auth, end - (unsigned char *)auth,
-				digest);
+	if (hmac_id == SCTP_AUTH_HMAC_ID_SHA1)
+		hmac_sha1_usingrawkey(asoc_key->data, asoc_key->len,
+				      (u8 *)auth, data_len, digest);
+	else
+		hmac_sha256_usingrawkey(asoc_key->data, asoc_key->len,
+					(u8 *)auth, data_len, digest);
 
-free:
 	if (free_key)
 		sctp_auth_key_put(asoc_key);
 }
 
 /* API Helpers */
@@ -786,18 +689,15 @@ int sctp_auth_ep_set_hmacs(struct sctp_endpoint *ep,
 	 * SHA1 is specified.
 	 */
 	for (i = 0; i < hmacs->shmac_num_idents; i++) {
 		id = hmacs->shmac_idents[i];
 
-		if (id > SCTP_AUTH_HMAC_ID_MAX)
+		if (!sctp_hmac_supported(id))
 			return -EOPNOTSUPP;
 
 		if (SCTP_AUTH_HMAC_ID_SHA1 == id)
 			has_sha1 = 1;
-
-		if (!sctp_hmac_list[id].hmac_name)
-			return -EOPNOTSUPP;
 	}
 
 	if (!has_sha1)
 		return -EINVAL;
 
@@ -1019,12 +919,10 @@ int sctp_auth_deact_key_id(struct sctp_endpoint *ep,
 	return 0;
 }
 
 int sctp_auth_init(struct sctp_endpoint *ep, gfp_t gfp)
 {
-	int err = -ENOMEM;
-
 	/* Allocate space for HMACS and CHUNKS authentication
 	 * variables.  There are arrays that we encode directly
 	 * into parameters to make the rest of the operations easier.
 	 */
 	if (!ep->auth_hmacs_list) {
@@ -1058,32 +956,23 @@ int sctp_auth_init(struct sctp_endpoint *ep, gfp_t gfp)
 		auth_chunks->param_hdr.length =
 				htons(sizeof(struct sctp_paramhdr));
 		ep->auth_chunk_list = auth_chunks;
 	}
 
-	/* Allocate and initialize transorms arrays for supported
-	 * HMACs.
-	 */
-	err = sctp_auth_init_hmacs(ep, gfp);
-	if (err)
-		goto nomem;
-
 	return 0;
 
 nomem:
 	/* Free all allocations */
 	kfree(ep->auth_hmacs_list);
 	kfree(ep->auth_chunk_list);
 	ep->auth_hmacs_list = NULL;
 	ep->auth_chunk_list = NULL;
-	return err;
+	return -ENOMEM;
 }
 
 void sctp_auth_free(struct sctp_endpoint *ep)
 {
 	kfree(ep->auth_hmacs_list);
 	kfree(ep->auth_chunk_list);
 	ep->auth_hmacs_list = NULL;
 	ep->auth_chunk_list = NULL;
-	sctp_auth_destroy_hmacs(ep->auth_hmacs);
-	ep->auth_hmacs = NULL;
 }
diff --git a/net/sctp/socket.c b/net/sctp/socket.c
index 1e5739858c206..1f3f1e7e1793b 100644
--- a/net/sctp/socket.c
+++ b/net/sctp/socket.c
@@ -9579,20 +9579,10 @@ static int sctp_sock_migrate(struct sock *oldsk, struct sock *newsk,
 	err = sctp_bind_addr_dup(&newsp->ep->base.bind_addr,
 				 &oldsp->ep->base.bind_addr, GFP_KERNEL);
 	if (err)
 		return err;
 
-	/* New ep's auth_hmacs should be set if old ep's is set, in case
-	 * that net->sctp.auth_enable has been changed to 0 by users and
-	 * new ep's auth_hmacs couldn't be set in sctp_endpoint_init().
-	 */
-	if (oldsp->ep->auth_hmacs) {
-		err = sctp_auth_init_hmacs(newsp->ep, GFP_KERNEL);
-		if (err)
-			return err;
-	}
-
 	sctp_auto_asconf_init(newsp);
 
 	/* Move any messages in the old socket's receive queue that are for the
 	 * peeled off association to the new socket's receive queue.
 	 */
-- 
2.50.1


