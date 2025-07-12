Return-Path: <linux-mips+bounces-9790-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 47B8EB02E2B
	for <lists+linux-mips@lfdr.de>; Sun, 13 Jul 2025 01:32:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9983DA47FC2
	for <lists+linux-mips@lfdr.de>; Sat, 12 Jul 2025 23:30:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5CE0E24729F;
	Sat, 12 Jul 2025 23:26:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Zj8p+TOd"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FF0B246BD8;
	Sat, 12 Jul 2025 23:26:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752362792; cv=none; b=azQL5B0/g9yL9SFbG8bl2K1foA11KmDZKoVyJL4+DlWOS31TjaIlhd+9lgQm0FSK7ho6xZelKZ0g4/JS5eix/OIOCzQUwvsCMYr2JBQi3kIqNjfvyP+XXkjKpWnAtmhPcAvRBZ0e6m0q2/ubrtjrkj7Lx3sPKJqy4wKBpnjvksE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752362792; c=relaxed/simple;
	bh=oVRGZdE8JlbqTZ+/Vc8lJfxP7t8h25c1QhOzJeVqedA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=TeyOlQXCoNygyOauO/XqWO2fqQmIhZqavYKvUxzQCOaa7D6on2qI3Gc7gKatfYdTyMAvjeAj2J1u8eTk8vhnKFp2cPD0hvQiq9zh1H/7wuua7+Kwb1ocX2ZNE8dsdWFVKEzxZXGP4QM6d810SLb/Koy5c4v/vqOA4m9JakXFH0I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Zj8p+TOd; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A7C7AC4CEF1;
	Sat, 12 Jul 2025 23:26:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752362792;
	bh=oVRGZdE8JlbqTZ+/Vc8lJfxP7t8h25c1QhOzJeVqedA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Zj8p+TOdVPu5lLHwjDdEJchVLZkO8F/qQjiyuD+eFQGiCyDQXvpReA3aDYR+mQdXN
	 KP5SpOK4fB3lqKTD1miviKDDEE0Rh1/t2wj68FTUNFC3sg/5fiECZziA+PJrcihbcg
	 EO2THy+IhzDgyjilv+vvjzNXCOgoFE/oeN39RE/9xR7cJuXS8JgPpnNegYYtrAHJn/
	 BP8LivY5YkQlIiBVMIrbibin415AHX10jV1s3KUYIvwDc/U1pvHnZVHEgqZskmXPls
	 60wYxMyihVBMQ31CfcCFnnUSBzCLxCm2+RHUrC7Fd2ORRkenalB5pgZEw3rJ9WKA4R
	 jV4MTcMcL6DBQ==
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
Subject: [PATCH 25/26] ipv6: Switch to higher-level SHA-1 functions
Date: Sat, 12 Jul 2025 16:23:16 -0700
Message-ID: <20250712232329.818226-26-ebiggers@kernel.org>
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

There's now a proper SHA-1 API that follows the usual conventions for
hash function APIs: sha1_init(), sha1_update(), sha1_final(), sha1().
The only remaining user of the older low-level SHA-1 API,
sha1_init_raw() and sha1_transform(), is ipv6_generate_stable_address().
I'd like to remove this older API, which is too low-level.

Unfortunately, ipv6_generate_stable_address() does in fact skip the
SHA-1 finalization for some reason.  So the values it computes are not
standard SHA-1 values, and it sort of does want the low-level API.

Still, it's still possible to use the higher-level functions sha1_init()
and sha1_update() to get the same result, provided that the resulting
state is used directly, skipping sha1_final().

So, let's do that instead.  This will allow removing the low-level API.

Signed-off-by: Eric Biggers <ebiggers@kernel.org>
---
 net/ipv6/addrconf.c | 23 +++++++++++++----------
 1 file changed, 13 insertions(+), 10 deletions(-)

diff --git a/net/ipv6/addrconf.c b/net/ipv6/addrconf.c
index d0e5b94c10af4..a4d47044f4557 100644
--- a/net/ipv6/addrconf.c
+++ b/net/ipv6/addrconf.c
@@ -3336,12 +3336,11 @@ static bool ipv6_reserved_interfaceid(struct in6_addr address)
 static int ipv6_generate_stable_address(struct in6_addr *address,
 					u8 dad_count,
 					const struct inet6_dev *idev)
 {
 	static DEFINE_SPINLOCK(lock);
-	static __u32 digest[SHA1_DIGEST_WORDS];
-	static __u32 workspace[SHA1_WORKSPACE_WORDS];
+	static struct sha1_ctx sha_ctx;
 
 	static union {
 		char __data[SHA1_BLOCK_SIZE];
 		struct {
 			struct in6_addr secret;
@@ -3353,36 +3352,40 @@ static int ipv6_generate_stable_address(struct in6_addr *address,
 
 	struct in6_addr secret;
 	struct in6_addr temp;
 	struct net *net = dev_net(idev->dev);
 
-	BUILD_BUG_ON(sizeof(data.__data) != sizeof(data));
-
 	if (idev->cnf.stable_secret.initialized)
 		secret = idev->cnf.stable_secret.secret;
 	else if (net->ipv6.devconf_dflt->stable_secret.initialized)
 		secret = net->ipv6.devconf_dflt->stable_secret.secret;
 	else
 		return -1;
 
 retry:
 	spin_lock_bh(&lock);
 
-	sha1_init_raw(digest);
+	sha1_init(&sha_ctx);
+
 	memset(&data, 0, sizeof(data));
-	memset(workspace, 0, sizeof(workspace));
 	memcpy(data.hwaddr, idev->dev->perm_addr, idev->dev->addr_len);
 	data.prefix[0] = address->s6_addr32[0];
 	data.prefix[1] = address->s6_addr32[1];
 	data.secret = secret;
 	data.dad_count = dad_count;
+	sha1_update(&sha_ctx, (const u8 *)&data, sizeof(data));
 
-	sha1_transform(digest, data.__data, workspace);
-
+	/*
+	 * Note that the SHA-1 finalization is omitted here, and the digest is
+	 * pulled directly from the internal SHA-1 state (making it incompatible
+	 * with standard SHA-1).  Unusual, but technically okay since the data
+	 * length is fixed and is a multiple of the SHA-1 block size.
+	 */
+	static_assert(sizeof(data) % SHA1_BLOCK_SIZE == 0);
 	temp = *address;
-	temp.s6_addr32[2] = (__force __be32)digest[0];
-	temp.s6_addr32[3] = (__force __be32)digest[1];
+	temp.s6_addr32[2] = (__force __be32)sha_ctx.state.h[0];
+	temp.s6_addr32[3] = (__force __be32)sha_ctx.state.h[1];
 
 	spin_unlock_bh(&lock);
 
 	if (ipv6_reserved_interfaceid(temp)) {
 		dad_count++;
-- 
2.50.1


