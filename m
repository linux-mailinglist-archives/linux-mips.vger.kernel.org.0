Return-Path: <linux-mips+bounces-15091-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id sj9xOhskMGoROwUAu9opvQ
	(envelope-from <linux-mips+bounces-15091-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Mon, 15 Jun 2026 18:11:07 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 8969E688274
	for <lists+linux-mips@lfdr.de>; Mon, 15 Jun 2026 18:11:07 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=J2bt7UtU;
	spf=pass (mail.lfdr.de: domain of "linux-mips+bounces-15091-lists+linux-mips=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-mips+bounces-15091-lists+linux-mips=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 5FA833014765
	for <lists+linux-mips@lfdr.de>; Mon, 15 Jun 2026 16:10:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C968F40911A;
	Mon, 15 Jun 2026 16:10:11 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76C1A408603;
	Mon, 15 Jun 2026 16:10:10 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781539811; cv=none; b=MZQqMCQtX3jiIn/HPzoIj6MHS5ShzEXqO8/nNYhhMCl5XeojQXurP1TJ/AXOX33g0MAjtSTmYy75nB8G53YhQe0WVLvuqKQKZmV4HwFAdllAzOElM47+xJnIqsh3Z21m3FOYm2CHHoBtYpSS5JYCfasdFMJi8oB21HEHXd4C84o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781539811; c=relaxed/simple;
	bh=RjmwbjJUekMN4XQbpwM2sAMQ8Q4VGqazX1lTIqnbeDs=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=IMl7CLdJOsS2s6bxCbiYu6LtSl35ibyDER8y61j9QAvdZR2VLKpRCnUJWFZJWGIMWcxlRNxAwAxt/x+J773LjG3QMktPr8+uR0bVZ/Q4X8HGr0n8SON811H+ce7WUmcdhZbFGrfUdWhmwCIXkGsjzpyfS0N5bGZhIc4USuEj9no=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=J2bt7UtU; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 659B51F000E9;
	Mon, 15 Jun 2026 16:09:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781539810;
	bh=WrhOiAXY4BpdFNkpuEH5kqbHucFA9LBquobYeTzjtI4=;
	h=From:Subject:Date:To:Cc;
	b=J2bt7UtU/OYY8PxVyIm3d95v5G+IcTrjBW3L2jU7dt2De3kFnXcxRBS+wcjkcf6fN
	 XltNpsJON5Ei+eQjAfRadOoGZ6Zr5MKKrnWqjtat85KDYFuJIzaAhhV9joTPZvvnm/
	 Upf4GSVXporZ+/9u524Qsag7+a/uWIBE8WrhynM4IvaF/bx9BOfhayePviKAuHtMdm
	 yF/mMlzcia/W4uNmZrGta+pMv2x8g5cbMGvX0YqVwoVCDJpU+Ht9xei0zv8nicGVwV
	 SRcRt86DYJ9ycUYURQM1lx9ByNJFh+o5TVH1JyohwC9u2Q2ptXr+Wwo4pEiWgn9BWI
	 W8aRU0vDmzPwg==
From: Vincent Mailhol <mailhol@kernel.org>
Subject: [PATCH 00/19] init: discoverable root partitions, a.k.a. an
 omittable "root=" cmdline option
Date: Mon, 15 Jun 2026 18:08:56 +0200
Message-Id: <20260615-discoverable-root_partitions-v1-0-39c78fac42e2@kernel.org>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x3MQQqEMAxA0atI1hZaQQWvMgySNlEDYiUpMiDef
 YrLt/j/BmMVNpiaG5QvMclHRWgbSBseKzuhauh8N/ghBEdiKV+sGHd2mnOZT9QipXbmImGKSNi
 PnqAuTuVFfu/+832eP+2uWG1uAAAA
X-Change-ID: 20260611-discoverable-root_partitions-bdacbada570d
To: Jens Axboe <axboe@kernel.dk>, Davidlohr Bueso <dave@stgolabs.net>, 
 Alexander Viro <viro@zeniv.linux.org.uk>, 
 Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>
Cc: linux-kernel@vger.kernel.org, linux-block@vger.kernel.org, 
 linux-efi@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
 Vincent Mailhol <mailhol@kernel.org>, 
 Richard Henderson <richard.henderson@linaro.org>, 
 Matt Turner <mattst88@gmail.com>, Magnus Lindholm <linmag7@gmail.com>, 
 linux-alpha@vger.kernel.org, Vineet Gupta <vgupta@kernel.org>, 
 linux-snps-arc@lists.infradead.org, Russell King <linux@armlinux.org.uk>, 
 linux-arm-kernel@lists.infradead.org, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>, 
 loongarch@lists.linux.dev, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
 linux-mips@vger.kernel.org, 
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>, 
 Helge Deller <deller@gmx.de>, linux-parisc@vger.kernel.org, 
 Madhavan Srinivasan <maddy@linux.ibm.com>, 
 Michael Ellerman <mpe@ellerman.id.au>, linuxppc-dev@lists.ozlabs.org, 
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, linux-riscv@lists.infradead.org, 
 Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>, 
 Alexander Gordeev <agordeev@linux.ibm.com>, linux-s390@vger.kernel.org, 
 Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, 
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, 
 x86@kernel.org, Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>, linux-doc@vger.kernel.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=6653; i=mailhol@kernel.org;
 h=from:subject:message-id; bh=RjmwbjJUekMN4XQbpwM2sAMQ8Q4VGqazX1lTIqnbeDs=;
 b=owGbwMvMwCV2McXO4Xp97WbG02pJDFkGyhcU3klMvHNzftiCl6lmH3kWl02+abz8VKXHlaTy/
 w4vP39V7pjIwiDGxWAppsiyrJyTW6Gj0Dvs0F9LmDmsTCBDpEUaGICAhYEvNzGv1EjHSM9U21DP
 EMjQMWLg4hSAqfbXZfgr2rolQuyW6w6JgNKDJ4tvO69i+ZPHkj6Tv9JAckFms/tLRoYma5u3R6a
 1csurnulLb7M78HnNmlIVnlf38k/kSby8dJsZAA==
X-Developer-Key: i=mailhol@kernel.org; a=openpgp;
 fpr=ED8F700574E67F20E574E8E2AB5FEB886DBB99C2
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-5.16 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-15091-lists,linux-mips=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:axboe@kernel.dk,m:dave@stgolabs.net,m:viro@zeniv.linux.org.uk,m:brauner@kernel.org,m:jack@suse.cz,m:linux-kernel@vger.kernel.org,m:linux-block@vger.kernel.org,m:linux-efi@vger.kernel.org,m:linux-fsdevel@vger.kernel.org,m:mailhol@kernel.org,m:richard.henderson@linaro.org,m:mattst88@gmail.com,m:linmag7@gmail.com,m:linux-alpha@vger.kernel.org,m:vgupta@kernel.org,m:linux-snps-arc@lists.infradead.org,m:linux@armlinux.org.uk,m:linux-arm-kernel@lists.infradead.org,m:catalin.marinas@arm.com,m:will@kernel.org,m:chenhuacai@kernel.org,m:kernel@xen0n.name,m:loongarch@lists.linux.dev,m:tsbogend@alpha.franken.de,m:linux-mips@vger.kernel.org,m:James.Bottomley@HansenPartnership.com,m:deller@gmx.de,m:linux-parisc@vger.kernel.org,m:maddy@linux.ibm.com,m:mpe@ellerman.id.au,m:linuxppc-dev@lists.ozlabs.org,m:pjw@kernel.org,m:palmer@dabbelt.com,m:aou@eecs.berkeley.edu,m:linux-riscv@lists.infradead.org,m:hca@linux.ibm.com,m:gor@linux.ibm.com,m:agordeev@linux.ibm.com,m:linux-s390@
 vger.kernel.org,m:tglx@kernel.org,m:mingo@redhat.com,m:bp@alien8.de,m:dave.hansen@linux.intel.com,m:x86@kernel.org,m:corbet@lwn.net,m:skhan@linuxfoundation.org,m:linux-doc@vger.kernel.org,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[mailhol@kernel.org,linux-mips@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[47];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_CC(0.00)[vger.kernel.org,kernel.org,linaro.org,gmail.com,lists.infradead.org,armlinux.org.uk,arm.com,xen0n.name,lists.linux.dev,alpha.franken.de,HansenPartnership.com,gmx.de,linux.ibm.com,ellerman.id.au,lists.ozlabs.org,dabbelt.com,eecs.berkeley.edu,redhat.com,alien8.de,linux.intel.com,lwn.net,linuxfoundation.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mailhol@kernel.org,linux-mips@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-mips];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gnu.org:url,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,vger.kernel.org:from_smtp,uapi-group.org:url]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 8969E688274

DPS [1] defines GPT partition type UUIDs for OS partitions and
attributes that control whether such partitions should be
automatically discovered. The specification states that:

  The OS can discover and mount the necessary file systems with a
  non-existent or incomplete /etc/fstab file and without the root=
  kernel command line option.

DPS is already implemented in systemd-gpt-auto-generator [2], which,
when embedded in an initrd, indeed allows automatic detection of the
root filesystem through its partition type UUID.

This series adds this discovery feature directly into the kernel so
that people who are not using systemd or not using an initrd can still
benefit from it. The implementation follows the same model as
systemd-gpt-auto-generator:

  - GPT partition type UUIDs are used for automatic discovery policy
    only. No root=PARTTYPEUUID=xxx cmdline option or similar syntax is
    added.

  - The root= cmdline option takes precedence. This prevents unexpected
    behaviour.

  - Only the disk with the active EFI System Partition is scanned, as
    required by DPS. The disk is identified through the Boot Loader
    Interface LoaderDevicePartUUID EFI variable.

The DPS no-auto attribute is also implemented, giving another option for
the user to disable this auto discovery. However, the DPS read-only
attribute is intentionally not enforced. The kernel already mounts the
root filesystem read-only by default unless the command line requests
rw, and user space remains responsible for deciding whether a discovered
root should later be remounted read-write based on DPS metadata and
local policy. The other partition type UUIDs (home, swap, var...) are
also out of scope for the same reason: user space remains responsible
for mounting anything other than the root partition.

Patch 1 adds the ARCH_HAS_DPS_ROOT_PARTITION_TYPE_UUID capability and
the hidden CONFIG_DPS_ROOT_AUTO_DISCOVERY Kconfig symbol used to signal
whether the feature is available. Patches 2 to 12 declare the
ARCH_HAS_DPS_ROOT_PARTITION_TYPE_UUID capability for the supported
architectures and define their architecture-specific root partition type
UUID values in asm/dps_root.h.

Patches 13 to 16 make the GPT partition type UUID and the no-auto
attribute available during early block lookup.

Patch 17 is a small code refactor that prepares for patch 18, which
updates the root mount path so that, when root= is omitted, the kernel
reads LoaderDevicePartUUID and uses the early block lookup
infrastructure to discover the DPS root partition on that disk.

Finally, patch 19 documents this automatic root discovery feature.

Tested with GRUB, which implements the LoaderDevicePartUUID EFI variable
in its bli module [3]. With this, I was able to boot a kernel with a
completely empty cmdline and no initrd.

[1] The Discoverable Partitions Specification (DPS)
Link: https://uapi-group.org/specifications/specs/discoverable_partitions_specification/

[2] systemd-gpt-auto-generator
Link: https://www.freedesktop.org/software/systemd/man/latest/systemd-gpt-auto-generator.html

[3] GRUB -- §16.2 bli
Link: https://www.gnu.org/software/grub/manual/grub/html_node/bli_005fmodule.html

Signed-off-by: Vincent Mailhol <mailhol@kernel.org>
---
Vincent Mailhol (19):
      init: add DPS root partition type UUID capability
      alpha: define DPS root partition type UUID
      arc: define DPS root partition type UUID
      arm: define DPS root partition type UUID
      arm64: define DPS root partition type UUID
      loongarch: define DPS root partition type UUID
      mips: define DPS root partition type UUIDs
      parisc: define DPS root partition type UUID
      powerpc: define DPS root partition type UUIDs
      riscv: define DPS root partition type UUIDs
      s390: define DPS root partition type UUIDs
      x86: define DPS root partition type UUIDs
      block: store GPT partition type UUID
      block: add early_lookup_bdev_by_type_uuid()
      block: store GPT attributes as a raw value
      block: don't discover partition with DPS no-auto GPT attribute
      init: factor out root device lookup into lookup_root_device()
      init: discover root by DPS partition type UUID
      docs: document discoverable root partitions

 Documentation/admin-guide/discoverable-root.rst | 33 +++++++++
 Documentation/admin-guide/index.rst             |  1 +
 Documentation/admin-guide/kernel-parameters.txt |  5 ++
 arch/alpha/Kconfig                              |  1 +
 arch/alpha/include/asm/dps_root.h               |  8 +++
 arch/arc/Kconfig                                |  1 +
 arch/arc/include/asm/dps_root.h                 |  8 +++
 arch/arm/Kconfig                                |  1 +
 arch/arm/include/asm/dps_root.h                 |  8 +++
 arch/arm64/Kconfig                              |  1 +
 arch/arm64/include/asm/dps_root.h               |  8 +++
 arch/loongarch/Kconfig                          |  1 +
 arch/loongarch/include/asm/dps_root.h           |  8 +++
 arch/mips/Kconfig                               |  1 +
 arch/mips/include/asm/dps_root.h                | 20 ++++++
 arch/parisc/Kconfig                             |  1 +
 arch/parisc/include/asm/dps_root.h              |  8 +++
 arch/powerpc/Kconfig                            |  1 +
 arch/powerpc/include/asm/dps_root.h             | 16 +++++
 arch/riscv/Kconfig                              |  1 +
 arch/riscv/include/asm/dps_root.h               | 12 ++++
 arch/s390/Kconfig                               |  1 +
 arch/s390/include/asm/dps_root.h                | 12 ++++
 arch/x86/Kconfig                                |  1 +
 arch/x86/include/asm/dps_root.h                 | 12 ++++
 block/blk.h                                     |  1 +
 block/early-lookup.c                            | 68 +++++++++++++++++-
 block/partitions/core.c                         |  2 +
 block/partitions/efi.c                          |  3 +
 block/partitions/efi.h                          | 11 ++-
 include/linux/blk_types.h                       |  1 +
 include/linux/blkdev.h                          |  5 ++
 include/linux/root_dev.h                        |  6 ++
 init/Kconfig                                    |  6 ++
 init/do_mounts.c                                | 94 ++++++++++++++++++++++++-
 35 files changed, 355 insertions(+), 12 deletions(-)
---
base-commit: 36808d5e983985bbda87e01059cccc071fe3ec8d
change-id: 20260611-discoverable-root_partitions-bdacbada570d

Best regards,
-- 
Vincent Mailhol <mailhol@kernel.org>


