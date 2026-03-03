Return-Path: <linux-mips+bounces-13322-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SFN6K9ggp2mYeQAAu9opvQ
	(envelope-from <linux-mips+bounces-13322-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Tue, 03 Mar 2026 18:56:40 +0100
X-Original-To: lists+linux-mips@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 45EA91F4DC3
	for <lists+linux-mips@lfdr.de>; Tue, 03 Mar 2026 18:56:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 52F44315C11B
	for <lists+linux-mips@lfdr.de>; Tue,  3 Mar 2026 17:53:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2454E4EA39E;
	Tue,  3 Mar 2026 17:53:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b="MraP35Bc"
X-Original-To: linux-mips@vger.kernel.org
Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D26483BED38;
	Tue,  3 Mar 2026 17:53:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.69.126.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772560402; cv=none; b=nzfkURENu8VrHGTXUszHdxUlITef9e7WIauR3O4PeIdF6mCx8BkrMyEwlX4bf9OgmQy6z6g9Ba//Tuj8pZXH08KosNt2Se/4SmOPvft9xNIUUwmX3FCrcN/TuEcqUHI/6nXTGoAyiIg+xHq4iggnZOaQH4fkuHLApwZdL0dAwRo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772560402; c=relaxed/simple;
	bh=Aq9UnkgRNsW2rt0ZQw598mGXDJfQHqGHprMzz3wL4sc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=XGV0gX1rZT61AsyX0tMbMLI0FIkIz4KrFMC3MDlzMEPFe588u34zxvCKQaqxKkw/XcvQ8ffTlmOcrhIQ9BgY12DQqWEIxXgvChWj1bgp9SXV8b+3P3h8lAxqWl9KrBMm1Sq2drJ3hw8ZpmfPoRCveyq5+ZOXP34MEmPdqlQL+CU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net; spf=pass smtp.mailfrom=weissschuh.net; dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b=MraP35Bc; arc=none smtp.client-ip=159.69.126.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=weissschuh.net
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1772560398;
	bh=Aq9UnkgRNsW2rt0ZQw598mGXDJfQHqGHprMzz3wL4sc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=MraP35BcBluwe6lKLj+b/nCwJM3n6PuN+n0QR9iBknTmXSbrCqebu+uVlnkUu9zkA
	 CxKp4uHfJZ3WCWWxw+AYzmydqRYLMqcRHY0a75aQfx0fQOhd5eO9/5iu0qocPtv2n0
	 fqxVBNog5E54H3lG4i5VjdgYT8AdOm2mQk8J9alU=
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Date: Tue, 03 Mar 2026 18:53:12 +0100
Subject: [PATCH 1/3] checksyscalls: move path to reference table to a
 variable
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260303-kbuild-missing-syscalls-v1-1-3b4d69b68c75@weissschuh.net>
References: <20260303-kbuild-missing-syscalls-v1-0-3b4d69b68c75@weissschuh.net>
In-Reply-To: <20260303-kbuild-missing-syscalls-v1-0-3b4d69b68c75@weissschuh.net>
To: Arnd Bergmann <arnd@arndb.de>, 
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: linux-arch@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-mips@vger.kernel.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1772560397; l=878;
 i=linux@weissschuh.net; s=20221212; h=from:subject:message-id;
 bh=Aq9UnkgRNsW2rt0ZQw598mGXDJfQHqGHprMzz3wL4sc=;
 b=Tw91EzsW5z0YzT4oFK04KaHpcYOo/IBci5OEz0BY/nDgtEyHYBzcKwUed2t0z1tRAd/bu++gh
 mR7C1o4swv8BLDGzZfpWdeXr060Vum3S4+zXOV6x5KGBTRH4jCJtbWO
X-Developer-Key: i=linux@weissschuh.net; a=ed25519;
 pk=KcycQgFPX2wGR5azS7RhpBqedglOZVgRPfdFSPB1LNw=
X-Rspamd-Queue-Id: 45EA91F4DC3
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[weissschuh.net,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[weissschuh.net:s=mail];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-13322-lists,linux-mips=lfdr.de];
	RCVD_COUNT_THREE(0.00)[3];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linux@weissschuh.net,linux-mips@vger.kernel.org];
	DKIM_TRACE(0.00)[weissschuh.net:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-mips];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,weissschuh.net:dkim,weissschuh.net:email,weissschuh.net:mid]
X-Rspamd-Action: no action

An upcoming patch will need to reuse this path.

Move it into a reusable variable.

Signed-off-by: Thomas Weißschuh <linux@weissschuh.net>
---
 scripts/checksyscalls.sh | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/scripts/checksyscalls.sh b/scripts/checksyscalls.sh
index 1e5d2eeb726d..9becaf8d7b78 100755
--- a/scripts/checksyscalls.sh
+++ b/scripts/checksyscalls.sh
@@ -10,6 +10,8 @@
 # checksyscalls.sh gcc gcc-options
 #
 
+reference_table="$(dirname $0)/../arch/x86/entry/syscalls/syscall_32.tbl"
+
 ignore_list() {
 cat << EOF
 #include <asm/types.h>
@@ -269,5 +271,5 @@ syscall_list() {
 	done
 }
 
-(ignore_list && syscall_list $(dirname $0)/../arch/x86/entry/syscalls/syscall_32.tbl) | \
+(ignore_list && syscall_list ${reference_table}) | \
 $* -Wno-error -Wno-unused-macros -E -x c - > /dev/null

-- 
2.53.0


