Return-Path: <linux-mips+bounces-15019-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Bq9+N4S+KGq8IwMAu9opvQ
	(envelope-from <linux-mips+bounces-15019-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Wed, 10 Jun 2026 03:31:48 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5729C6653A3
	for <lists+linux-mips@lfdr.de>; Wed, 10 Jun 2026 03:31:48 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=Cl+wZQcU;
	spf=pass (mail.lfdr.de: domain of "linux-mips+bounces-15019-lists+linux-mips=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-mips+bounces-15019-lists+linux-mips=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id E689B302BFCE
	for <lists+linux-mips@lfdr.de>; Wed, 10 Jun 2026 01:31:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AE209224B15;
	Wed, 10 Jun 2026 01:31:33 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8685419C556;
	Wed, 10 Jun 2026 01:31:32 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781055093; cv=none; b=aTIucN0qNDe7zgTaRnuMqQwwO83u5YOYbdBAQY6jorLAYq/iilSe/LJH1Eilc45/Swo2uRZpNDIIQnFWzj0J9/bxT3B3mZ80RMVv/oAOQMhaUWKBAQbv55cgFv1H6Nfp91JVbjOBkd7dOR9TPNXiUZmhx1dK07JSIftbpbSeWuU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781055093; c=relaxed/simple;
	bh=jX8yPtpLfo082EYodxQm099uzhz7yXG2rLZ5bXSmxRs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=NZEb5NiNCLEAn28iAITFzZXfuPAdOCsPr0nrz7ql9DTVJ3Tx0k9gL0F6hUyfxrfUzrKte9AHqbOvG11hKWB5DEabR6K472sdzGlluuQx33WHhL1bOg0WcGdak6SzLg3MQTMJSeJ9XuBoSrpuQqa5jISlTqHZh3//WRkIA4ocCXM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Cl+wZQcU; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E5B3D1F00893;
	Wed, 10 Jun 2026 01:31:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781055092;
	bh=8wSvSr5wgJYhG1T0+g2KEtONnq0QWojGMFssZM8uMN0=;
	h=From:Date:Subject:To:Cc;
	b=Cl+wZQcUQ0btce1W4WCJokjCCNBpEG4u/71kr35kGKxv368MLZBO4Tynuzore4Pjf
	 qNVwZLNzHpb3q+dPNTHkeRAvIfCa+XoAJq+CYCQMYidsA/EblfJ6NR87oIqXoeYk/Q
	 Ndkocd0APGtwvKlblhm6d8lbkFnbXkwnqajr3e7mWyDD9zzuiARjtsTKMZB7+rIiy1
	 xlxwT+UuEf2L7kMUooDCVhpRsjzQlYbt7SUzKWT1jsfMK0CXthkVXX+9fK3R1xnHZo
	 v1MnAxvYNEkpjKA0aMmX3P44/VSNkSOOVxGJ4t7waxeho/24GL1w0AuovYPUp1iiJq
	 cJuyIAQiG1aAg==
From: Nathan Chancellor <nathan@kernel.org>
Date: Tue, 09 Jun 2026 18:31:21 -0700
Subject: [PATCH] MIPS: VDSO: Avoid including .got in dynamic segment
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260609-mips-vdso-fix-section-layout-v1-1-0e80ffadf7c7@kernel.org>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yWMQQqDQAwAvyI5N7DmsFi/UnrQ3Wgj6spGxSL+v
 Wl7HJiZE5SzsEJdnJB5F5U0G5S3AsKrmXtGicZAjrzzrsJJFsU9asJODlQOqxU4Nu+0rUie2lB
 W0QW6gy2WzGb99o/nn3VrB4u+T7iuDxpQDjuAAAAA
X-Change-ID: 20260608-mips-vdso-fix-section-layout-262bc18d0c29
To: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>, 
 Thomas Gleixner <tglx@kernel.org>
Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
 linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org, 
 llvm@lists.linux.dev, Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
 Nathan Chancellor <nathan@kernel.org>
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=4237; i=nathan@kernel.org;
 h=from:subject:message-id; bh=jX8yPtpLfo082EYodxQm099uzhz7yXG2rLZ5bXSmxRs=;
 b=owGbwMvMwCUmm602sfCA1DTG02pJDFka+wofLJfzPXsw55Pw/U/7Z9dYHnSd0FGRaVWk8cf1w
 Sf2Q2v8O0pZGMS4GGTFFFmqH6seNzScc5bxxqlJMHNYmUCGMHBxCsBEFloyMhzsT/UO/r/K+O3x
 M9N++F5p09F8N/Xl++pn635VxLSZ71jP8D/39K/iBW1mp5yWvHu//vGz3alWz/XEPcMOvyiLcPV
 M9uYCAA==
X-Developer-Key: i=nathan@kernel.org; a=openpgp;
 fpr=2437CB76E544CB6AB3D9DFD399739260CB6CB716
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.66 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-15019-lists,linux-mips=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_CC(0.00)[alpha.franken.de,google.com,vger.kernel.org,lists.linux.dev,gmail.com,kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:thomas.weissschuh@linutronix.de,m:tglx@kernel.org,m:tsbogend@alpha.franken.de,m:morbo@google.com,m:justinstitt@google.com,m:linux-mips@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:llvm@lists.linux.dev,m:nick.desaulniers+lkml@gmail.com,m:nathan@kernel.org,m:nickdesaulniers@gmail.com,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[nathan@kernel.org,linux-mips@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nathan@kernel.org,linux-mips@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCPT_COUNT_SEVEN(0.00)[10];
	TAGGED_RCPT(0.00)[linux-mips,lkml];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 5729C6653A3

After commit 2db1ec80dfd5 ("MIPS: VDSO: Fold MIPS_DISABLE_VDSO into
MIPS_GENERIC_GETTIMEOFDAY"), building ARCH=mips allnoconfig with LLVM=1
shows some warnings from llvm-readelf while checking the VDSO for
dynamic relocations:

  llvm-readelf: warning: 'arch/mips/vdso/vdso.so.dbg.raw': invalid PT_DYNAMIC size (0xa4)
  llvm-readelf: warning: 'arch/mips/vdso/vdso.so.dbg.raw': PT_DYNAMIC dynamic table is invalid: SHT_DYNAMIC will be used

The blamed commit alters the link order of objects into vdso.so.raw,
placing vgettimeofday.o after sigreturn.o. This ultimately results in
the .text section shrinking slightly in size, which in turn changes the
offset of the .dynamic section.

  -  [ 9] .text             PROGBITS        000002f0 0002f0 000930 00  AX  0   0 16
  -  [10] .dynamic          DYNAMIC         00000c20 000c20 000090 08   A  5   0  4
  +  [ 9] .text             PROGBITS        000002f0 0002f0 000924 00  AX  0   0 16
  +  [10] .dynamic          DYNAMIC         00000c14 000c14 000090 08   A  5   0  4

Changing the offset of the .dynamic section causes the dynamic segment
size to grow by the same amount, which triggers a warning in
llvm-readelf because PT_DYNAMIC's p_filesz (0xa4) is no longer a
multiple of its sh_entsize (8):

  -  DYNAMIC        0x000c20 0x00000c20 0x00000c20 0x00098 0x00098 R   0x10
  +  DYNAMIC        0x000c14 0x00000c14 0x00000c14 0x000a4 0x000a4 R   0x10

The size of the dynamic segment was already incorrect before the blamed
comment, as it should be 0x90 like the .dynamic section above (18
entries at 8 bytes per entry); it just so happens that 0x98 % 8 is 0,
whereas 0xa4 % 8 is 4, so there was no warning.

Looking at the section to segment mapping of the dynamic segment reveals
that it includes the .got section, as it is implicitly placed after
.dynamic by ld.lld's orphan section heuristics and inherits its segments
from the linker script.

  [ 9] .text             PROGBITS        000002f0 0002f0 000924 00  AX  0   0 16
  [10] .dynamic          DYNAMIC         00000c14 000c14 000090 08   A  5   0  4
  [11] .got              PROGBITS        00000cb0 000cb0 000008 00 WAp  0   0 16

  Section to Segment mapping:
   Segment Sections...
    00     .mips_abiflags
    01     .reginfo
    02     .mips_abiflags .reginfo .hash .dynsym .dynstr .gnu.version .gnu.version_d .note .text .dynamic .got
    03     .dynamic .got
    04     .note

Explicitly describe the .got section in the MIPS VDSO linker script
after .rodata, which switches back to the default text segment,
resulting in a dynamic segment that is the exact size of the .dynamic
section as expected with no other layout changes.

  -  DYNAMIC        0x000c14 0x00000c14 0x00000c14 0x000a4 0x000a4 R   0x10
  +  DYNAMIC        0x000c14 0x00000c14 0x00000c14 0x00090 0x00090 R   0x4

  -   03     .dynamic .got
  +   03     .dynamic

Closes: https://github.com/ClangBuiltLinux/linux/issues/2166
Fixes: 2db1ec80dfd5 ("MIPS: VDSO: Fold MIPS_DISABLE_VDSO into MIPS_GENERIC_GETTIMEOFDAY")
Signed-off-by: Nathan Chancellor <nathan@kernel.org>
---
The fixes tag feels a little strong since it seems like it has just been
luck up until this point that there has been no warning but I decided to
be conservative and include it regardless. Feel free to remove it if you
see fit.

I think this should go via timers/vdso with the blamed commit. I plan to
send a follow up series for 7.3 to add '--orphan-handling' to the MIPS
VDSO to avoid issues like this in the future but that can go via the
MIPS tree, as it is not really a fix and I will need to properly test
it.
---
 arch/mips/vdso/vdso.lds.S | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/mips/vdso/vdso.lds.S b/arch/mips/vdso/vdso.lds.S
index 05badf3ae0ff..278ab6444e98 100644
--- a/arch/mips/vdso/vdso.lds.S
+++ b/arch/mips/vdso/vdso.lds.S
@@ -56,6 +56,7 @@ SECTIONS
 	.dynamic	: { *(.dynamic) }		:text :dynamic
 
 	.rodata		: { *(.rodata*) }		:text
+	.got		: { *(.got) }
 
 	_end = .;
 	PROVIDE(end = .);

---
base-commit: 13f6218e6fe79dc64aed76d738b765b45f62492b
change-id: 20260608-mips-vdso-fix-section-layout-262bc18d0c29

Best regards,
--  
Cheers,
Nathan


