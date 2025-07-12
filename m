Return-Path: <linux-mips+bounces-9783-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 79C93B02DFC
	for <lists+linux-mips@lfdr.de>; Sun, 13 Jul 2025 01:29:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 34E86188BEFA
	for <lists+linux-mips@lfdr.de>; Sat, 12 Jul 2025 23:29:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 156F4230BD2;
	Sat, 12 Jul 2025 23:26:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ROFWht91"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D60572405ED;
	Sat, 12 Jul 2025 23:26:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752362789; cv=none; b=J15SdpDmXoiyH0TtTxu172BXDoGBtLqXyqzzVDoxhkoRS1dmlzOWl6Y7l/7KmN+y3P0Jq/ivke3xdIRs5jWfOIXsIhMocLfi5aIh7bhYAcviPR2a7w6HXc3kaa16IXWGNW0fq/bQQB0oA8+rkYYKCqEny/3TA4nVqCc9+NdUtiE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752362789; c=relaxed/simple;
	bh=upgrbJIyKUJoRun4h/w8rzDBpBYiF16g2cfEnbcJkVg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rtVAXM6WRBMuVbKyfsiEAR7UM4YlZnRQp2tNhelflf67pDg3sUDDq2O3lLPoN4nMTiYpZu0XOUf+/CRGDkG4oLk+wnVCn/L5/ovzM4kHPh2bqW2cmLAqSvZZv3QAPFNOY0b/SCvtR7vM4c6jd0UbHYTfdsNoQ20JqXUfFIb45Yk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ROFWht91; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 68845C4CEF5;
	Sat, 12 Jul 2025 23:26:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752362788;
	bh=upgrbJIyKUJoRun4h/w8rzDBpBYiF16g2cfEnbcJkVg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ROFWht91DC5XpPUdH8iXRlXvtmJOeGAoILEueEXRbxTAPmypO9d9+eWkmEkY7OfkC
	 EznYlgw770sM+2hauKHQe9ZXD1pmPfGnLAWBZEKvJ68wP2iozUUeXCcATDci9H+nql
	 53wI7ihD56fb/OKj38J+495wElTRth1QNz9lquAmwXhzHyShTkHCCg1y7/9DV5nE7E
	 DU6aJPNVq/OYfOPBT9oIPAopTGITq//h/vgYLJmpT7RxnkrmoKv6FuCRonUZesj0o0
	 SKmYw0xcwLeiizFPDxQqieqRzqlDu+cKh4N4/Cjwnsv1xm5C8P4t3ULqlN0Wr+zUrc
	 BRmisBhki99bw==
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
Subject: [PATCH 18/26] ipv6: sr: Use HMAC-SHA1 and HMAC-SHA256 library functions
Date: Sat, 12 Jul 2025 16:23:09 -0700
Message-ID: <20250712232329.818226-19-ebiggers@kernel.org>
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

Use the HMAC-SHA1 and HMAC-SHA256 library functions instead of
crypto_shash.  This is simpler and faster.

Signed-off-by: Eric Biggers <ebiggers@kernel.org>
---
 include/net/seg6_hmac.h |  12 ---
 net/ipv6/Kconfig        |   6 +-
 net/ipv6/seg6.c         |   7 --
 net/ipv6/seg6_hmac.c    | 199 ++++------------------------------------
 4 files changed, 22 insertions(+), 202 deletions(-)

diff --git a/include/net/seg6_hmac.h b/include/net/seg6_hmac.h
index 24f733b3e3fe9..3fe4123dbbf0a 100644
--- a/include/net/seg6_hmac.h
+++ b/include/net/seg6_hmac.h
@@ -17,11 +17,10 @@
 #include <linux/route.h>
 #include <net/seg6.h>
 #include <linux/seg6_hmac.h>
 #include <linux/rhashtable-types.h>
 
-#define SEG6_HMAC_MAX_DIGESTSIZE	160
 #define SEG6_HMAC_RING_SIZE		256
 
 struct seg6_hmac_info {
 	struct rhash_head node;
 	struct rcu_head rcu;
@@ -30,17 +29,10 @@ struct seg6_hmac_info {
 	char secret[SEG6_HMAC_SECRET_LEN];
 	u8 slen;
 	u8 alg_id;
 };
 
-struct seg6_hmac_algo {
-	u8 alg_id;
-	char name[64];
-	struct crypto_shash * __percpu *tfms;
-	struct shash_desc * __percpu *shashs;
-};
-
 extern int seg6_hmac_compute(struct seg6_hmac_info *hinfo,
 			     struct ipv6_sr_hdr *hdr, struct in6_addr *saddr,
 			     u8 *output);
 extern struct seg6_hmac_info *seg6_hmac_info_lookup(struct net *net, u32 key);
 extern int seg6_hmac_info_add(struct net *net, u32 key,
@@ -48,17 +40,13 @@ extern int seg6_hmac_info_add(struct net *net, u32 key,
 extern int seg6_hmac_info_del(struct net *net, u32 key);
 extern int seg6_push_hmac(struct net *net, struct in6_addr *saddr,
 			  struct ipv6_sr_hdr *srh);
 extern bool seg6_hmac_validate_skb(struct sk_buff *skb);
 #ifdef CONFIG_IPV6_SEG6_HMAC
-extern int seg6_hmac_init(void);
-extern void seg6_hmac_exit(void);
 extern int seg6_hmac_net_init(struct net *net);
 extern void seg6_hmac_net_exit(struct net *net);
 #else
-static inline int seg6_hmac_init(void) { return 0; }
-static inline void seg6_hmac_exit(void) {}
 static inline int seg6_hmac_net_init(struct net *net) { return 0; }
 static inline void seg6_hmac_net_exit(struct net *net) {}
 #endif
 
 #endif
diff --git a/net/ipv6/Kconfig b/net/ipv6/Kconfig
index 1c9c686d9522f..76eb48e766382 100644
--- a/net/ipv6/Kconfig
+++ b/net/ipv6/Kconfig
@@ -302,14 +302,12 @@ config IPV6_SEG6_LWTUNNEL
 	  If unsure, say N.
 
 config IPV6_SEG6_HMAC
 	bool "IPv6: Segment Routing HMAC support"
 	depends on IPV6
-	select CRYPTO
-	select CRYPTO_HMAC
-	select CRYPTO_SHA1
-	select CRYPTO_SHA256
+	select CRYPTO_LIB_SHA1
+	select CRYPTO_LIB_SHA256
 	help
 	  Support for HMAC signature generation and verification
 	  of SR-enabled packets.
 
 	  If unsure, say N.
diff --git a/net/ipv6/seg6.c b/net/ipv6/seg6.c
index 180da19c148c1..a5c4c629b788c 100644
--- a/net/ipv6/seg6.c
+++ b/net/ipv6/seg6.c
@@ -520,20 +520,14 @@ int __init seg6_init(void)
 
 	err = seg6_local_init();
 	if (err)
 		goto out_unregister_iptun;
 
-	err = seg6_hmac_init();
-	if (err)
-		goto out_unregister_seg6;
-
 	pr_info("Segment Routing with IPv6\n");
 
 out:
 	return err;
-out_unregister_seg6:
-	seg6_local_exit();
 out_unregister_iptun:
 	seg6_iptunnel_exit();
 out_unregister_genl:
 	genl_unregister_family(&seg6_genl_family);
 out_unregister_pernet:
@@ -541,11 +535,10 @@ int __init seg6_init(void)
 	goto out;
 }
 
 void seg6_exit(void)
 {
-	seg6_hmac_exit();
 	seg6_local_exit();
 	seg6_iptunnel_exit();
 	genl_unregister_family(&seg6_genl_family);
 	unregister_pernet_subsys(&ip6_segments_ops);
 }
diff --git a/net/ipv6/seg6_hmac.c b/net/ipv6/seg6_hmac.c
index f78ecb6ad8383..17e57da813012 100644
--- a/net/ipv6/seg6_hmac.c
+++ b/net/ipv6/seg6_hmac.c
@@ -14,11 +14,10 @@
 #include <linux/net.h>
 #include <linux/netdevice.h>
 #include <linux/in6.h>
 #include <linux/icmpv6.h>
 #include <linux/mroute6.h>
-#include <linux/slab.h>
 #include <linux/rhashtable.h>
 
 #include <linux/netfilter.h>
 #include <linux/netfilter_ipv6.h>
 
@@ -32,11 +31,12 @@
 #include <net/ndisc.h>
 #include <net/ip6_route.h>
 #include <net/addrconf.h>
 #include <net/xfrm.h>
 
-#include <crypto/hash.h>
+#include <crypto/sha1.h>
+#include <crypto/sha2.h>
 #include <net/seg6.h>
 #include <net/genetlink.h>
 #include <net/seg6_hmac.h>
 #include <linux/random.h>
 
@@ -75,21 +75,10 @@ static const struct rhashtable_params rht_params = {
 	.key_len		= sizeof(u32),
 	.automatic_shrinking	= true,
 	.obj_cmpfn		= seg6_hmac_cmpfn,
 };
 
-static struct seg6_hmac_algo hmac_algos[] = {
-	{
-		.alg_id = SEG6_HMAC_ALGO_SHA1,
-		.name = "hmac(sha1)",
-	},
-	{
-		.alg_id = SEG6_HMAC_ALGO_SHA256,
-		.name = "hmac(sha256)",
-	},
-};
-
 static struct sr6_tlv_hmac *seg6_get_tlv_hmac(struct ipv6_sr_hdr *srh)
 {
 	struct sr6_tlv_hmac *tlv;
 
 	if (srh->hdrlen < (srh->first_segment + 1) * 2 + 5)
@@ -105,79 +94,17 @@ static struct sr6_tlv_hmac *seg6_get_tlv_hmac(struct ipv6_sr_hdr *srh)
 		return NULL;
 
 	return tlv;
 }
 
-static struct seg6_hmac_algo *__hmac_get_algo(u8 alg_id)
-{
-	struct seg6_hmac_algo *algo;
-	int i, alg_count;
-
-	alg_count = ARRAY_SIZE(hmac_algos);
-	for (i = 0; i < alg_count; i++) {
-		algo = &hmac_algos[i];
-		if (algo->alg_id == alg_id)
-			return algo;
-	}
-
-	return NULL;
-}
-
-static int __do_hmac(struct seg6_hmac_info *hinfo, const char *text, u8 psize,
-		     u8 *output, int outlen)
-{
-	struct seg6_hmac_algo *algo;
-	struct crypto_shash *tfm;
-	struct shash_desc *shash;
-	int ret, dgsize;
-
-	algo = __hmac_get_algo(hinfo->alg_id);
-	if (!algo)
-		return -ENOENT;
-
-	tfm = *this_cpu_ptr(algo->tfms);
-
-	dgsize = crypto_shash_digestsize(tfm);
-	if (dgsize > outlen) {
-		pr_debug("sr-ipv6: __do_hmac: digest size too big (%d / %d)\n",
-			 dgsize, outlen);
-		return -ENOMEM;
-	}
-
-	ret = crypto_shash_setkey(tfm, hinfo->secret, hinfo->slen);
-	if (ret < 0) {
-		pr_debug("sr-ipv6: crypto_shash_setkey failed: err %d\n", ret);
-		goto failed;
-	}
-
-	shash = *this_cpu_ptr(algo->shashs);
-	shash->tfm = tfm;
-
-	ret = crypto_shash_digest(shash, text, psize, output);
-	if (ret < 0) {
-		pr_debug("sr-ipv6: crypto_shash_digest failed: err %d\n", ret);
-		goto failed;
-	}
-
-	return dgsize;
-
-failed:
-	return ret;
-}
-
 int seg6_hmac_compute(struct seg6_hmac_info *hinfo, struct ipv6_sr_hdr *hdr,
 		      struct in6_addr *saddr, u8 *output)
 {
 	__be32 hmackeyid = cpu_to_be32(hinfo->hmackeyid);
-	u8 tmp_out[SEG6_HMAC_MAX_DIGESTSIZE];
-	int plen, i, dgsize, wrsize;
+	int plen, i, ret = 0;
 	char *ring, *off;
 
-	/* a 160-byte buffer for digest output allows to store highest known
-	 * hash function (RadioGatun) with up to 1216 bits
-	 */
-
 	/* saddr(16) + first_seg(1) + flags(1) + keyid(4) + seglist(16n) */
 	plen = 16 + 1 + 1 + 4 + (hdr->first_segment + 1) * 16;
 
 	/* this limit allows for 14 segments */
 	if (plen >= SEG6_HMAC_RING_SIZE)
@@ -216,26 +143,29 @@ int seg6_hmac_compute(struct seg6_hmac_info *hinfo, struct ipv6_sr_hdr *hdr,
 	for (i = 0; i < hdr->first_segment + 1; i++) {
 		memcpy(off, hdr->segments + i, 16);
 		off += 16;
 	}
 
-	dgsize = __do_hmac(hinfo, ring, plen, tmp_out,
-			   SEG6_HMAC_MAX_DIGESTSIZE);
+	memset(output, 0, SEG6_HMAC_FIELD_LEN);
+	switch (hinfo->alg_id) {
+	case SEG6_HMAC_ALGO_SHA1:
+		hmac_sha1_usingrawkey(hinfo->secret, hinfo->slen, ring, plen,
+				      output);
+		static_assert(SHA1_DIGEST_SIZE <= SEG6_HMAC_FIELD_LEN);
+		break;
+	case SEG6_HMAC_ALGO_SHA256:
+		hmac_sha256_usingrawkey(hinfo->secret, hinfo->slen, ring, plen,
+					output);
+		static_assert(SHA256_DIGEST_SIZE <= SEG6_HMAC_FIELD_LEN);
+		break;
+	default:
+		ret = -ENOENT;
+		break;
+	}
 	local_unlock_nested_bh(&hmac_storage.bh_lock);
 	local_bh_enable();
-
-	if (dgsize < 0)
-		return dgsize;
-
-	wrsize = SEG6_HMAC_FIELD_LEN;
-	if (wrsize > dgsize)
-		wrsize = dgsize;
-
-	memset(output, 0, SEG6_HMAC_FIELD_LEN);
-	memcpy(output, tmp_out, wrsize);
-
-	return 0;
+	return ret;
 }
 EXPORT_SYMBOL(seg6_hmac_compute);
 
 /* checks if an incoming SR-enabled packet's HMAC status matches
  * the incoming policy.
@@ -357,106 +287,17 @@ int seg6_push_hmac(struct net *net, struct in6_addr *saddr,
 	rcu_read_unlock();
 	return err;
 }
 EXPORT_SYMBOL(seg6_push_hmac);
 
-static int seg6_hmac_init_algo(void)
-{
-	struct seg6_hmac_algo *algo;
-	struct crypto_shash *tfm;
-	struct shash_desc *shash;
-	int i, alg_count, cpu;
-	int ret = -ENOMEM;
-
-	alg_count = ARRAY_SIZE(hmac_algos);
-
-	for (i = 0; i < alg_count; i++) {
-		struct crypto_shash **p_tfm;
-		int shsize;
-
-		algo = &hmac_algos[i];
-		algo->tfms = alloc_percpu(struct crypto_shash *);
-		if (!algo->tfms)
-			goto error_out;
-
-		for_each_possible_cpu(cpu) {
-			tfm = crypto_alloc_shash(algo->name, 0, 0);
-			if (IS_ERR(tfm)) {
-				ret = PTR_ERR(tfm);
-				goto error_out;
-			}
-			p_tfm = per_cpu_ptr(algo->tfms, cpu);
-			*p_tfm = tfm;
-		}
-
-		p_tfm = raw_cpu_ptr(algo->tfms);
-		tfm = *p_tfm;
-
-		shsize = sizeof(*shash) + crypto_shash_descsize(tfm);
-
-		algo->shashs = alloc_percpu(struct shash_desc *);
-		if (!algo->shashs)
-			goto error_out;
-
-		for_each_possible_cpu(cpu) {
-			shash = kzalloc_node(shsize, GFP_KERNEL,
-					     cpu_to_node(cpu));
-			if (!shash)
-				goto error_out;
-			*per_cpu_ptr(algo->shashs, cpu) = shash;
-		}
-	}
-
-	return 0;
-
-error_out:
-	seg6_hmac_exit();
-	return ret;
-}
-
-int __init seg6_hmac_init(void)
-{
-	return seg6_hmac_init_algo();
-}
-
 int __net_init seg6_hmac_net_init(struct net *net)
 {
 	struct seg6_pernet_data *sdata = seg6_pernet(net);
 
 	return rhashtable_init(&sdata->hmac_infos, &rht_params);
 }
 
-void seg6_hmac_exit(void)
-{
-	struct seg6_hmac_algo *algo = NULL;
-	struct crypto_shash *tfm;
-	struct shash_desc *shash;
-	int i, alg_count, cpu;
-
-	alg_count = ARRAY_SIZE(hmac_algos);
-	for (i = 0; i < alg_count; i++) {
-		algo = &hmac_algos[i];
-
-		if (algo->shashs) {
-			for_each_possible_cpu(cpu) {
-				shash = *per_cpu_ptr(algo->shashs, cpu);
-				kfree(shash);
-			}
-			free_percpu(algo->shashs);
-		}
-
-		if (algo->tfms) {
-			for_each_possible_cpu(cpu) {
-				tfm = *per_cpu_ptr(algo->tfms, cpu);
-				crypto_free_shash(tfm);
-			}
-			free_percpu(algo->tfms);
-		}
-	}
-}
-EXPORT_SYMBOL(seg6_hmac_exit);
-
 void __net_exit seg6_hmac_net_exit(struct net *net)
 {
 	struct seg6_pernet_data *sdata = seg6_pernet(net);
 
 	rhashtable_free_and_destroy(&sdata->hmac_infos, seg6_free_hi, NULL);
-- 
2.50.1


