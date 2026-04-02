Return-Path: <linux-mips+bounces-14015-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id II46Ou1/zmk9oAYAu9opvQ
	(envelope-from <linux-mips+bounces-14015-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Thu, 02 Apr 2026 16:40:45 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A30F038AB44
	for <lists+linux-mips@lfdr.de>; Thu, 02 Apr 2026 16:40:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 4B881308B1D8
	for <lists+linux-mips@lfdr.de>; Thu,  2 Apr 2026 14:36:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7362C3ED5A7;
	Thu,  2 Apr 2026 14:36:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b="sn1Zy3Hd"
X-Original-To: linux-mips@vger.kernel.org
Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BE2A3E4C8F;
	Thu,  2 Apr 2026 14:36:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.69.126.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775140589; cv=none; b=R9ConScDQmT6KlwRKO/wiuIHMupR2+zgwG164cHC/PLvxpIP+WsN2bP6i2MRoeIxRN0/DyLwORlC49Odykb6W70B11D2S4DWYjcSwO37xcpg72ePsacOFce4Ii1mNXgHtupFsYSVWyagfSTQ8l8EGeSxKZcPr6zXgu+xlSxpxpA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775140589; c=relaxed/simple;
	bh=xylhAipvxTB+ISF9S0d4UGLx0KBp/dBJ8DMqcdbkdWA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Dm+4qIHVLwdeTZlT8o13TNcEpY6q22JZUnHmOm8kv1m6NBAokQJZtldzzTmlC+tFjgGDana2Cuo4Rl+xl9CiESoEokYjISXevKhOx0SjNIKLZRTwC7kR3ZQnJH9lnKNe6xuYR/aYfNgy7iIJCvMerJ9XJqON6CjYHa+BmCd+1Ss=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net; spf=pass smtp.mailfrom=weissschuh.net; dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b=sn1Zy3Hd; arc=none smtp.client-ip=159.69.126.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=weissschuh.net
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1775140579;
	bh=xylhAipvxTB+ISF9S0d4UGLx0KBp/dBJ8DMqcdbkdWA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=sn1Zy3HdCbG6i6SMsH9XPtOpoZHjoh5rBjZMaSWJ9tcmYMEhm0WFn6jJvbQoj3wKF
	 bpSm9T0EcgUA5hETHbtTMwy5Na8YdSVQJS3F44r7dWyhqeCv1hmikvkuD5SAvn7fC1
	 CPUqq6vuvEiK7jrkgU3Gk8dx0WXQvELJa0fkjFvI=
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Date: Thu, 02 Apr 2026 16:36:18 +0200
Subject: [PATCH v3 1/3] checksyscalls: move path to reference table to a
 variable
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260402-kbuild-missing-syscalls-v3-1-6641be1de2db@weissschuh.net>
References: <20260402-kbuild-missing-syscalls-v3-0-6641be1de2db@weissschuh.net>
In-Reply-To: <20260402-kbuild-missing-syscalls-v3-0-6641be1de2db@weissschuh.net>
To: Arnd Bergmann <arnd@arndb.de>, 
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
 Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>
Cc: linux-arch@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-mips@vger.kernel.org, linux-kbuild@vger.kernel.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1775140579; l=965;
 i=linux@weissschuh.net; s=20221212; h=from:subject:message-id;
 bh=xylhAipvxTB+ISF9S0d4UGLx0KBp/dBJ8DMqcdbkdWA=;
 b=U4ufPy7yusmx3g9WrzVqK8kf1pG5gnWUnESSxWeykmI/g8PNL7Q86UkvIxgyrEmg1DxiYohOm
 IjJZlXVwtDJCLRPdZO9ODegzX3zkPHRMBz9jjBbX9DVZsI31DICf/pQ
X-Developer-Key: i=linux@weissschuh.net; a=ed25519;
 pk=KcycQgFPX2wGR5azS7RhpBqedglOZVgRPfdFSPB1LNw=
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[weissschuh.net,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[weissschuh.net:s=mail];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-14015-lists,linux-mips=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[weissschuh.net:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linux@weissschuh.net,linux-mips@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-0.996];
	RCPT_COUNT_SEVEN(0.00)[9];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-mips];
	DBL_BLOCKED_OPENRESOLVER(0.00)[checksyscalls.sh:url,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,weissschuh.net:dkim,weissschuh.net:email,weissschuh.net:mid,arndb.de:email]
X-Rspamd-Queue-Id: A30F038AB44
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

An upcoming patch will need to reuse this path.

Move it into a reusable variable.

Signed-off-by: Thomas Weißschuh <linux@weissschuh.net>
Acked-by: Arnd Bergmann <arnd@arndb.de>
Reviewed-by: Nicolas Schier <nsc@kernel.org>
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


