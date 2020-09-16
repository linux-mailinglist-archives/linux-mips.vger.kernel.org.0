Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8974A26B96A
	for <lists+linux-mips@lfdr.de>; Wed, 16 Sep 2020 03:34:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726196AbgIPBeC (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 15 Sep 2020 21:34:02 -0400
Received: from relay1.mymailcheap.com ([144.217.248.100]:37689 "EHLO
        relay1.mymailcheap.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726172AbgIPBeC (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 15 Sep 2020 21:34:02 -0400
Received: from filter2.mymailcheap.com (filter2.mymailcheap.com [91.134.140.82])
        by relay1.mymailcheap.com (Postfix) with ESMTPS id E98753F1C5;
        Wed, 16 Sep 2020 01:33:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
        by filter2.mymailcheap.com (Postfix) with ESMTP id 3A88A2A4FC;
        Wed, 16 Sep 2020 03:33:58 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=mymailcheap.com;
        s=default; t=1600220038;
        bh=FjruncmdZj6uIeGuLheRJ+8pVazJAoGulZ4DJHYWUgc=;
        h=Date:From:To:CC:Subject:In-Reply-To:References:From;
        b=gD9m5IQayXuGra2HSgwb0GvklTFIdwVr7Tf6i55qKH46awD9RXCeK2xrZdgB6QNJ4
         bDOEUdwbscpaqaBnY5Jtxgp4dNpNCRUlcZnbCcEfgMt7lddU9B9ucYeHgxhW5cKJs7
         uxIINz6SslhirdxtfPOJW126JEPBGF6S7nsJc7qw=
X-Virus-Scanned: Debian amavisd-new at filter2.mymailcheap.com
Received: from filter2.mymailcheap.com ([127.0.0.1])
        by localhost (filter2.mymailcheap.com [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id SzcjUj3d1gSt; Wed, 16 Sep 2020 03:33:55 +0200 (CEST)
Received: from mail20.mymailcheap.com (mail20.mymailcheap.com [51.83.111.147])
        (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by filter2.mymailcheap.com (Postfix) with ESMTPS;
        Wed, 16 Sep 2020 03:33:55 +0200 (CEST)
Received: from [148.251.23.173] (ml.mymailcheap.com [148.251.23.173])
        by mail20.mymailcheap.com (Postfix) with ESMTP id E95C440FF3;
        Wed, 16 Sep 2020 01:33:54 +0000 (UTC)
Authentication-Results: mail20.mymailcheap.com;
        dkim=pass (1024-bit key; unprotected) header.d=flygoat.com header.i=@flygoat.com header.b="tCdT3qCW";
        dkim-atps=neutral
AI-Spam-Status: Not processed
Received: from [127.0.0.1] (114-42-189-223.dynamic-ip.hinet.net [114.42.189.223])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by mail20.mymailcheap.com (Postfix) with ESMTPSA id A14E140FE4;
        Wed, 16 Sep 2020 01:33:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=flygoat.com;
        s=default; t=1600220001;
        bh=FjruncmdZj6uIeGuLheRJ+8pVazJAoGulZ4DJHYWUgc=;
        h=Date:From:To:CC:Subject:In-Reply-To:References:From;
        b=tCdT3qCWWBMKg210zEe6c8YVnZ3IYlqV782hBtZPIGnc44bQyZXiDd1dNCEZWeOqk
         MXdYjjIEVoSxLSr6orW5L9CKqrhzbCZwE6YWoL5RLtJm8f7szPFZg0Z9xhjysvrWQS
         p4Mh19HQoXqz7JGNDmO/DLyEBzj0lrX3T4g9sj5s=
Date:   Wed, 16 Sep 2020 09:33:13 +0800
From:   Jiaxun Yang <jiaxun.yang@flygoat.com>
To:     Jinyang He <hejinyang@loongson.cn>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Huacai Chen <chenhc@lemote.com>
CC:     Youling Tang <tangyouling@loongson.cn>, linux-mips@vger.kernel.org,
        linux-kernel@vger.kernel.org, kexec@lists.infradead.org,
        Xuefeng Li <lixuefeng@loongson.cn>
Subject: Re: [PATCH] MIPS: Loongson64: Add kexec/kdump support
User-Agent: K-9 Mail for Android
In-Reply-To: <1600175263-7872-1-git-send-email-hejinyang@loongson.cn>
References: <1600175263-7872-1-git-send-email-hejinyang@loongson.cn>
Message-ID: <376B4B91-0736-43FA-87EA-43E12FF24EF1@flygoat.com>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: E95C440FF3
X-Spamd-Result: default: False [-0.10 / 10.00];
         RCVD_VIA_SMTP_AUTH(0.00)[];
         ARC_NA(0.00)[];
         R_DKIM_ALLOW(0.00)[flygoat.com:s=default];
         RECEIVED_SPAMHAUS_PBL(0.00)[114.42.189.223:received];
         FROM_HAS_DN(0.00)[];
         TO_DN_SOME(0.00)[];
         TO_MATCH_ENVRCPT_ALL(0.00)[];
         MIME_GOOD(-0.10)[text/plain];
         R_SPF_SOFTFAIL(0.00)[~all];
         ML_SERVERS(-3.10)[148.251.23.173];
         DKIM_TRACE(0.00)[flygoat.com:+];
         DMARC_POLICY_ALLOW(0.00)[flygoat.com,none];
         RCPT_COUNT_SEVEN(0.00)[8];
         DMARC_POLICY_ALLOW_WITH_FAILURES(0.00)[];
         RCVD_NO_TLS_LAST(0.10)[];
         FROM_EQ_ENVFROM(0.00)[];
         MIME_TRACE(0.00)[0:+];
         ASN(0.00)[asn:24940, ipnet:148.251.0.0/16, country:DE];
         RCVD_COUNT_TWO(0.00)[2];
         MID_RHS_MATCH_FROM(0.00)[];
         HFILTER_HELO_BAREIP(3.00)[148.251.23.173,1]
X-Rspamd-Server: mail20.mymailcheap.com
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org



=E4=BA=8E 2020=E5=B9=B49=E6=9C=8815=E6=97=A5 GMT+08:00 =E4=B8=8B=E5=8D=889=
:07:43, Jinyang He <hejinyang@loongson=2Ecn> =E5=86=99=E5=88=B0:
>Add loongson_kexec_prepare(), loongson_kexec_shutdown() and
>loongson_kexec_crashdown() for passing the parameters of kexec_args=2E
>
>To start loongson64, CPU0 needs 3 parameters:
>fw_arg0: the number of cmd=2E
>fw_arg1: cmd structure which seems strange, the cmd array[index]'s
>         value is cmd string's address, index >=3D 1=2E
>fw_arg2: environment=2E
>
>Secondary CPUs do not need parameter at once=2E They query their
>mailbox to get PC, SP and GP in a loop before CPU0 brings them up
>and passes these parameters via mailbox=2E
>
>loongson_kexec_prepare(): Alloc new memory to save cmd for kexec=2E
>Combine the kexec append option string as cmd structure, and the cmd
>struct will be parsed in fw_init_cmdline() of arch/mips/fw/lib/cmdline=2E=
c=2E
>image->control_code_page need pointing to a safe memory page=2E In order =
to
>maintain compatibility for the old firmware the low 2MB is reserverd
>and safe for Loongson=2E So let it points here=2E
>
>loongson_kexec_shutdown(): Wake up all present CPUs and let them go
>to reboot_code_buffer=2E Pass the kexec parameters to kexec_args=2E
>
>loongson_crash_shutdown(): Pass the kdump parameters to kexec_args=2E
>
>The assembly part provide a way like BIOS doing to keep secondary
>CPUs in a querying loop=2E
>
>This patch referenced [1][2][3]=2E
>
>[1] arch/mips/cavium-octeon/setup=2Ec
>[2] https://patchwork=2Ekernel=2Eorg/patch/10799217/
>[3] https://gitee=2Ecom/loongsonlab/qemu/blob/master/hw/mips/loongson3a_r=
om=2Eh
>
>Co-developed-by: Youling Tang <tangyouling@loongson=2Ecn>
>Signed-off-by: Youling Tang <tangyouling@loongson=2Ecn>
>Signed-off-by: Jinyang He <hejinyang@loongson=2Ecn>
>---
> arch/mips/kernel/relocate_kernel=2ES | 19 ++++++++
> arch/mips/loongson64/reset=2Ec       | 88 ++++++++++++++++++++++++++++++=
++++++++
> 2 files changed, 107 insertions(+)
>
>diff --git a/arch/mips/kernel/relocate_kernel=2ES b/arch/mips/kernel/relo=
cate_kernel=2ES
>index ac87089=2E=2E061cbfb 100644
>--- a/arch/mips/kernel/relocate_kernel=2ES
>+++ b/arch/mips/kernel/relocate_kernel=2ES
>@@ -133,6 +133,25 @@ LEAF(kexec_smp_wait)
> #else
> 	sync
> #endif
>+
>+#ifdef CONFIG_CPU_LOONGSON64
>+#define MAILBOX_BASE 0x900000003ff01000

Please avoid hardcoded SMP information=2E You're breaking Loongson 3B supp=
ort=2E


Thank=2E

- Jiaxun


>+	mfc0  t1, CP0_EBASE
>+	andi  t1, MIPS_EBASE_CPUNUM
>+	dli   t0, MAILBOX_BASE
>+	andi  t3, t1, 0x3
>+	sll   t3, 8
>+	or    t0, t0, t3	/* insert core id */
>+	andi  t2, t1, 0xc
>+	dsll  t2, 42
>+	or    t0, t0, t2	/* insert node id */
>+1:	ld    s1, 0x20(t0)	/* get PC via mailbox0 */
>+	beqz  s1, 1b
>+	ld    sp, 0x28(t0)	/* get SP via mailbox1 */
>+	ld    gp, 0x30(t0)	/* get GP via mailbox2 */
>+	ld    a1, 0x38(t0)
>+	jr    s1
>+#endif
> 	j		s1
> 	END(kexec_smp_wait)
> #endif
>diff --git a/arch/mips/loongson64/reset=2Ec b/arch/mips/loongson64/reset=
=2Ec
>index 3bb8a1e=2E=2E322c326 100644
>--- a/arch/mips/loongson64/reset=2Ec
>+++ b/arch/mips/loongson64/reset=2Ec
>@@ -47,12 +47,100 @@ static void loongson_halt(void)
> 	}
> }
>=20
>+#ifdef CONFIG_KEXEC
>+#include <linux/cpu=2Eh>
>+#include <linux/kexec=2Eh>
>+
>+#include <asm/bootinfo=2Eh>
>+
>+#define CONTROL_CODE_PAGE    0xFFFFFFFF80000000UL
>+static int kexec_argc;
>+static int kdump_argc;
>+static void *kexec_argv;
>+static void *kdump_argv;
>+
>+static int loongson_kexec_prepare(struct kimage *image)
>+{
>+	int i, offt, argc =3D 0;
>+	int *argv;
>+	char *str, *ptr, *bootloader =3D "kexec";
>+
>+	argv =3D kmalloc(COMMAND_LINE_SIZE, GFP_KERNEL);
>+	if (!argv)
>+		return -ENOMEM;
>+
>+	for (i =3D 0; i < image->nr_segments; i++) {
>+		if (!strncmp(bootloader, (char *)image->segment[i]=2Ebuf,
>+				strlen(bootloader))) {
>+			argv[argc++] =3D fw_arg1 + COMMAND_LINE_SIZE/2;
>+			str =3D (char *)argv + COMMAND_LINE_SIZE/2;
>+			memcpy(str, image->segment[i]=2Ebuf, COMMAND_LINE_SIZE/2);
>+			ptr =3D strchr(str, ' ');
>+			while (ptr) {
>+				*ptr =3D '\0';
>+				if (ptr[1] !=3D ' ') {
>+					offt =3D (int)(ptr - str + 1);
>+					argv[argc++] =3D fw_arg1 + COMMAND_LINE_SIZE/2 + offt;
>+				}
>+				ptr =3D strchr(ptr + 1, ' ');
>+			}
>+			break;
>+		}
>+	}
>+
>+	/* Kexec/kdump needs a safe page to save reboot_code_buffer=2E */
>+	image->control_code_page =3D virt_to_page((void *)CONTROL_CODE_PAGE);
>+
>+	if (image->type =3D=3D KEXEC_TYPE_CRASH) {
>+		kfree(kdump_argv);
>+		kdump_argc =3D argc;
>+		kdump_argv =3D argv;
>+	} else {
>+		kfree(kexec_argv);
>+		kexec_argc =3D argc;
>+		kexec_argv =3D argv;
>+	}
>+
>+	return 0;
>+}
>+
>+static void loongson_kexec_shutdown(void)
>+{
>+#ifdef CONFIG_SMP
>+	bringup_nonboot_cpus(loongson_sysconf=2Enr_cpus);
>+#endif
>+	fw_arg0 =3D kexec_argc;
>+	memcpy((void *)fw_arg1, kexec_argv, COMMAND_LINE_SIZE);
>+
>+	kexec_args[0] =3D fw_arg0;
>+	kexec_args[1] =3D fw_arg1;
>+	kexec_args[2] =3D fw_arg2;
>+}
>+
>+static void loongson_crash_shutdown(struct pt_regs *regs)
>+{
>+	default_machine_crash_shutdown(regs);
>+	fw_arg0 =3D kdump_argc;
>+	memcpy((void *)fw_arg1, kdump_argv, COMMAND_LINE_SIZE);
>+
>+	kexec_args[0] =3D fw_arg0;
>+	kexec_args[1] =3D fw_arg1;
>+	kexec_args[2] =3D fw_arg2;
>+}
>+#endif
>+
> static int __init mips_reboot_setup(void)
> {
> 	_machine_restart =3D loongson_restart;
> 	_machine_halt =3D loongson_halt;
> 	pm_power_off =3D loongson_poweroff;
>=20
>+#ifdef CONFIG_KEXEC
>+	_machine_kexec_prepare =3D loongson_kexec_prepare;
>+	_machine_kexec_shutdown =3D loongson_kexec_shutdown;
>+	_machine_crash_shutdown =3D loongson_crash_shutdown;
>+#endif
>+
> 	return 0;
> }
>=20
