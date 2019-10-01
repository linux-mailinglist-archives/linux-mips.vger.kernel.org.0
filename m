Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EE808C432C
	for <lists+linux-mips@lfdr.de>; Tue,  1 Oct 2019 23:54:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728474AbfJAVy3 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 1 Oct 2019 17:54:29 -0400
Received: from mail-eopbgr750115.outbound.protection.outlook.com ([40.107.75.115]:30851
        "EHLO NAM02-BL2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1728374AbfJAVy2 (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Tue, 1 Oct 2019 17:54:28 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=e6JyXmKYfAM2pBepbyziyoJTpfpovQXu3GNeDGQ5+YcLjOcd0ppYD84iKXM6rLyavT95jGts5IOQKlsEQ71zktKM8tDJnVtbW9ILzyERzA5m9MfeKQzt+z/6AxHdc3e6eFD9KWay4dzPJBtrJLYdiKBJ95Ndq41YPvGWr1Ljcnc9Nr2+s6eYhK8rc/5CkAbS7orEpQqIMJ3h881ev4/8MnWubaxjjLp43KHHFKd0FKzRODY2SmX1Bv1cOm/ttN9tw6wZqWSnOWgy4tl52PfYbU4gTIb/+ODMHvpsXtoDyFQ/y/B5FuFmqBo7eqNUlO+rxJK4TPlzwgyPkVqM2hosgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=c0HFqTmB5HlOC7377lZyro2MRboHr5sygckm1ojSSmc=;
 b=INOyJG9UuQueR4mVeQzyvavc9zW0QEETNpjuodyqM4/LUW8T45uUfEylQIRpYfsYwRyQDB5jAVxwMlXh4sq5401APOlKr4v0YzrAUTXf4ynxaaPWbMeaD/vFSl/jb+Al9W1KTXCczmLyuRE/nXcaZQQQ9spko35h+fZVwxs9z23eEOnQIpVROIm3tByZY1K4/ClihJ1yCnlzDWqfWayGQHcHHwdfJOqGy8D+6+STUb+Kk6vMlxd3Rxs4PCis5bwHT0vWo21l7mauDF+tRjouP4dhT/in3brDa5q75v/D+lk5XDVxon7Y92uCw1beKA4cKCiSr+hLWILF2vzCHl6RgA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wavecomp.com; dmarc=pass action=none header.from=mips.com;
 dkim=pass header.d=mips.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wavecomp.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=c0HFqTmB5HlOC7377lZyro2MRboHr5sygckm1ojSSmc=;
 b=jd6MUnj3izzRbeFHAHUKMSLAuMofi17CnjkjE0vt0FZW6PxcqlYShp5iKTq7m5t1zKSL76ltTYxNDGv6kYIYFQLNePl+PkekEqOc17qvDu10SjNB0NhLZ/Mu9PRjlP4JUOY8C9jqje4L0BYAK15D6iMjMNfV8a813IVxlblalks=
Received: from MWHPR2201MB1277.namprd22.prod.outlook.com (10.172.60.12) by
 MWHPR2201MB1581.namprd22.prod.outlook.com (10.174.167.30) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2305.15; Tue, 1 Oct 2019 21:54:17 +0000
Received: from MWHPR2201MB1277.namprd22.prod.outlook.com
 ([fe80::498b:c2cd:e816:1481]) by MWHPR2201MB1277.namprd22.prod.outlook.com
 ([fe80::498b:c2cd:e816:1481%2]) with mapi id 15.20.2305.022; Tue, 1 Oct 2019
 21:54:17 +0000
From:   Paul Burton <paul.burton@mips.com>
To:     "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>
CC:     Huacai Chen <chenhc@lemote.com>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Paul Burton <pburton@wavecomp.com>
Subject: [PATCH v2 36/36] MIPS: Check Loongson3 LL/SC errata workaround
 correctness
Thread-Topic: [PATCH v2 36/36] MIPS: Check Loongson3 LL/SC errata workaround
 correctness
Thread-Index: AQHVeKKxElSaWtuqP0WF1bkQzrRwhQ==
Date:   Tue, 1 Oct 2019 21:53:44 +0000
Message-ID: <20191001215249.4157062-37-paul.burton@mips.com>
References: <20191001215249.4157062-1-paul.burton@mips.com>
In-Reply-To: <20191001215249.4157062-1-paul.burton@mips.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: BYAPR07CA0093.namprd07.prod.outlook.com
 (2603:10b6:a03:12b::34) To MWHPR2201MB1277.namprd22.prod.outlook.com
 (2603:10b6:301:18::12)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=pburton@wavecomp.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.23.0
x-originating-ip: [12.94.197.246]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 0bb4137f-0dcc-42f3-b3b9-08d746b9d440
x-ms-traffictypediagnostic: MWHPR2201MB1581:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MWHPR2201MB1581A7FCA4E9C6C3720CAF26C19D0@MWHPR2201MB1581.namprd22.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2150;
x-forefront-prvs: 0177904E6B
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(136003)(39850400004)(366004)(346002)(396003)(376002)(189003)(199004)(8936002)(26005)(478600001)(6512007)(8676002)(81166006)(81156014)(6916009)(386003)(76176011)(186003)(6506007)(25786009)(52116002)(6436002)(99286004)(6486002)(316002)(102836004)(54906003)(14454004)(5640700003)(2501003)(486006)(66476007)(7736002)(256004)(14444005)(66556008)(66946007)(1076003)(64756008)(36756003)(107886003)(66066001)(66446008)(4326008)(42882007)(2906002)(6666004)(3846002)(6116002)(476003)(446003)(2616005)(11346002)(2351001)(71190400001)(44832011)(5660300002)(50226002)(305945005)(71200400001);DIR:OUT;SFP:1102;SCL:1;SRVR:MWHPR2201MB1581;H:MWHPR2201MB1277.namprd22.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: wavecomp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Gp9EukrRI//ySsEbyxFC7DwWSrHGX+BHBDcIKvhPYwYfH3x45jVV7Aj6pPsM71QzPeWg1vpduACibv6gjYqOsOBc7Xq1r77Vx6kCT7VTJuVmEV79r7tdAIoyxF9urw5YCY0tozDPQuBHGCRMPCosdsOw4UhsUtFjbdIjDZOZ0HAF9DmuK26iUI2RtoOWAuRnRGHHCyR/coFUZVCvcmq8ZLPZnqSyqCEI0mwpyQIa+z0YkOFzRCHgMPC9Wp8uO0HocNl2mOXIIESLiTma5TlM/oePIHMHAm5vhxHoAZ6ZcC3TnqyX7hsEyH1TTBNINzXriKv7w6T6RYEyTcrewtDKZstwgH1RJmQkGSRbAlC3OaXR8zZA+6bqUq1cE4UQQnpZ9z+ZGW5A0E4lTYuRn9tPqb7AN/NVUXaKmZXzSdnanuY=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: mips.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0bb4137f-0dcc-42f3-b3b9-08d746b9d440
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Oct 2019 21:53:44.2067
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 463607d3-1db3-40a0-8a29-970c56230104
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: KL3NDdSO6my+cfFkU9PIXHW4Qjr0f2kDoxJKpNqDQttws39kVBbAwSYlSXxu49XFH3W8UXB145+iEOmb7HMj6g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR2201MB1581
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

When Loongson3 LL/SC errata workarounds are enabled (ie.
CONFIG_CPU_LOONGSON3_WORKAROUNDS=3Dy) run a tool to scan through the
compiled kernel & ensure that the workaround is applied correctly. That
is, ensure that:

  - Every LL or LLD instruction is preceded by a sync instruction.

  - Any branches from within an LL/SC loop to outside of that loop
    target a sync instruction.

Reasoning for these conditions can be found by reading the comment above
the definition of __SYNC_loongson3_war in arch/mips/include/asm/sync.h.

This tool will help ensure that we don't inadvertently introduce code
paths that miss the required workarounds.

Signed-off-by: Paul Burton <paul.burton@mips.com>

---

Changes in v2:
- Only try to build loongson3-llsc-check from arch/mips/Makefile when
  CONFIG_CPU_LOONGSON3_WORKAROUNDS is enabled.

 arch/mips/Makefile                     |   3 +
 arch/mips/Makefile.postlink            |  10 +-
 arch/mips/tools/.gitignore             |   1 +
 arch/mips/tools/Makefile               |   5 +
 arch/mips/tools/loongson3-llsc-check.c | 307 +++++++++++++++++++++++++
 5 files changed, 325 insertions(+), 1 deletion(-)
 create mode 100644 arch/mips/tools/loongson3-llsc-check.c

diff --git a/arch/mips/Makefile b/arch/mips/Makefile
index cdc09b71febe..0a5eab626260 100644
--- a/arch/mips/Makefile
+++ b/arch/mips/Makefile
@@ -14,6 +14,9 @@
=20
 archscripts: scripts_basic
 	$(Q)$(MAKE) $(build)=3Darch/mips/tools elf-entry
+ifeq ($(CONFIG_CPU_LOONGSON3_WORKAROUNDS),y)
+	$(Q)$(MAKE) $(build)=3Darch/mips/tools loongson3-llsc-check
+endif
 	$(Q)$(MAKE) $(build)=3Darch/mips/boot/tools relocs
=20
 KBUILD_DEFCONFIG :=3D 32r2el_defconfig
diff --git a/arch/mips/Makefile.postlink b/arch/mips/Makefile.postlink
index 4eea4188cb20..f03fdc95143e 100644
--- a/arch/mips/Makefile.postlink
+++ b/arch/mips/Makefile.postlink
@@ -3,7 +3,8 @@
 # Post-link MIPS pass
 # =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D
 #
-# 1. Insert relocations into vmlinux
+# 1. Check that Loongson3 LL/SC workarounds are applied correctly
+# 2. Insert relocations into vmlinux
=20
 PHONY :=3D __archpost
 __archpost:
@@ -11,6 +12,10 @@ __archpost:
 -include include/config/auto.conf
 include scripts/Kbuild.include
=20
+CMD_LS3_LLSC =3D arch/mips/tools/loongson3-llsc-check
+quiet_cmd_ls3_llsc =3D LLSCCHK $@
+      cmd_ls3_llsc =3D $(CMD_LS3_LLSC) $@
+
 CMD_RELOCS =3D arch/mips/boot/tools/relocs
 quiet_cmd_relocs =3D RELOCS $@
       cmd_relocs =3D $(CMD_RELOCS) $@
@@ -19,6 +24,9 @@ quiet_cmd_relocs =3D RELOCS $@
=20
 vmlinux: FORCE
 	@true
+ifeq ($(CONFIG_CPU_LOONGSON3_WORKAROUNDS),y)
+	$(call if_changed,ls3_llsc)
+endif
 ifeq ($(CONFIG_RELOCATABLE),y)
 	$(call if_changed,relocs)
 endif
diff --git a/arch/mips/tools/.gitignore b/arch/mips/tools/.gitignore
index 56d34ccccce4..b0209450d9ff 100644
--- a/arch/mips/tools/.gitignore
+++ b/arch/mips/tools/.gitignore
@@ -1 +1,2 @@
 elf-entry
+loongson3-llsc-check
diff --git a/arch/mips/tools/Makefile b/arch/mips/tools/Makefile
index 3baee4bc6775..aaef688749f5 100644
--- a/arch/mips/tools/Makefile
+++ b/arch/mips/tools/Makefile
@@ -3,3 +3,8 @@ hostprogs-y :=3D elf-entry
 PHONY +=3D elf-entry
 elf-entry: $(obj)/elf-entry
 	@:
+
+hostprogs-$(CONFIG_CPU_LOONGSON3_WORKAROUNDS) +=3D loongson3-llsc-check
+PHONY +=3D loongson3-llsc-check
+loongson3-llsc-check: $(obj)/loongson3-llsc-check
+	@:
diff --git a/arch/mips/tools/loongson3-llsc-check.c b/arch/mips/tools/loong=
son3-llsc-check.c
new file mode 100644
index 000000000000..0ebddd0ae46f
--- /dev/null
+++ b/arch/mips/tools/loongson3-llsc-check.c
@@ -0,0 +1,307 @@
+// SPDX-License-Identifier: GPL-2.0-only
+#include <byteswap.h>
+#include <elf.h>
+#include <endian.h>
+#include <errno.h>
+#include <fcntl.h>
+#include <inttypes.h>
+#include <stdbool.h>
+#include <stdio.h>
+#include <stdlib.h>
+#include <string.h>
+#include <sys/mman.h>
+#include <sys/types.h>
+#include <sys/stat.h>
+#include <unistd.h>
+
+#ifdef be32toh
+/* If libc provides le{16,32,64}toh() then we'll use them */
+#elif BYTE_ORDER =3D=3D LITTLE_ENDIAN
+# define le16toh(x)	(x)
+# define le32toh(x)	(x)
+# define le64toh(x)	(x)
+#elif BYTE_ORDER =3D=3D BIG_ENDIAN
+# define le16toh(x)	bswap_16(x)
+# define le32toh(x)	bswap_32(x)
+# define le64toh(x)	bswap_64(x)
+#endif
+
+/* MIPS opcodes, in bits 31:26 of an instruction */
+#define OP_SPECIAL	0x00
+#define OP_REGIMM	0x01
+#define OP_BEQ		0x04
+#define OP_BNE		0x05
+#define OP_BLEZ		0x06
+#define OP_BGTZ		0x07
+#define OP_BEQL		0x14
+#define OP_BNEL		0x15
+#define OP_BLEZL	0x16
+#define OP_BGTZL	0x17
+#define OP_LL		0x30
+#define OP_LLD		0x34
+#define OP_SC		0x38
+#define OP_SCD		0x3c
+
+/* Bits 20:16 of OP_REGIMM instructions */
+#define REGIMM_BLTZ	0x00
+#define REGIMM_BGEZ	0x01
+#define REGIMM_BLTZL	0x02
+#define REGIMM_BGEZL	0x03
+#define REGIMM_BLTZAL	0x10
+#define REGIMM_BGEZAL	0x11
+#define REGIMM_BLTZALL	0x12
+#define REGIMM_BGEZALL	0x13
+
+/* Bits 5:0 of OP_SPECIAL instructions */
+#define SPECIAL_SYNC	0x0f
+
+static void usage(FILE *f)
+{
+	fprintf(f, "Usage: loongson3-llsc-check /path/to/vmlinux\n");
+}
+
+static int se16(uint16_t x)
+{
+	return (int16_t)x;
+}
+
+static bool is_ll(uint32_t insn)
+{
+	switch (insn >> 26) {
+	case OP_LL:
+	case OP_LLD:
+		return true;
+
+	default:
+		return false;
+	}
+}
+
+static bool is_sc(uint32_t insn)
+{
+	switch (insn >> 26) {
+	case OP_SC:
+	case OP_SCD:
+		return true;
+
+	default:
+		return false;
+	}
+}
+
+static bool is_sync(uint32_t insn)
+{
+	/* Bits 31:11 should all be zeroes */
+	if (insn >> 11)
+		return false;
+
+	/* Bits 5:0 specify the SYNC special encoding */
+	if ((insn & 0x3f) !=3D SPECIAL_SYNC)
+		return false;
+
+	return true;
+}
+
+static bool is_branch(uint32_t insn, int *off)
+{
+	switch (insn >> 26) {
+	case OP_BEQ:
+	case OP_BEQL:
+	case OP_BNE:
+	case OP_BNEL:
+	case OP_BGTZ:
+	case OP_BGTZL:
+	case OP_BLEZ:
+	case OP_BLEZL:
+		*off =3D se16(insn) + 1;
+		return true;
+
+	case OP_REGIMM:
+		switch ((insn >> 16) & 0x1f) {
+		case REGIMM_BGEZ:
+		case REGIMM_BGEZL:
+		case REGIMM_BGEZAL:
+		case REGIMM_BGEZALL:
+		case REGIMM_BLTZ:
+		case REGIMM_BLTZL:
+		case REGIMM_BLTZAL:
+		case REGIMM_BLTZALL:
+			*off =3D se16(insn) + 1;
+			return true;
+
+		default:
+			return false;
+		}
+
+	default:
+		return false;
+	}
+}
+
+static int check_ll(uint64_t pc, uint32_t *code, size_t sz)
+{
+	ssize_t i, max, sc_pos;
+	int off;
+
+	/*
+	 * Every LL must be preceded by a sync instruction in order to ensure
+	 * that instruction reordering doesn't allow a prior memory access to
+	 * execute after the LL & cause erroneous results.
+	 */
+	if (!is_sync(le32toh(code[-1]))) {
+		fprintf(stderr, "%" PRIx64 ": LL not preceded by sync\n", pc);
+		return -EINVAL;
+	}
+
+	/* Find the matching SC instruction */
+	max =3D sz / 4;
+	for (sc_pos =3D 0; sc_pos < max; sc_pos++) {
+		if (is_sc(le32toh(code[sc_pos])))
+			break;
+	}
+	if (sc_pos >=3D max) {
+		fprintf(stderr, "%" PRIx64 ": LL has no matching SC\n", pc);
+		return -EINVAL;
+	}
+
+	/*
+	 * Check branches within the LL/SC loop target sync instructions,
+	 * ensuring that speculative execution can't generate memory accesses
+	 * due to instructions outside of the loop.
+	 */
+	for (i =3D 0; i < sc_pos; i++) {
+		if (!is_branch(le32toh(code[i]), &off))
+			continue;
+
+		/*
+		 * If the branch target is within the LL/SC loop then we don't
+		 * need to worry about it.
+		 */
+		if ((off >=3D -i) && (off <=3D sc_pos))
+			continue;
+
+		/* If the branch targets a sync instruction we're all good... */
+		if (is_sync(le32toh(code[i + off])))
+			continue;
+
+		/* ...but if not, we have a problem */
+		fprintf(stderr, "%" PRIx64 ": Branch target not a sync\n",
+			pc + (i * 4));
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
+static int check_code(uint64_t pc, uint32_t *code, size_t sz)
+{
+	int err =3D 0;
+
+	if (sz % 4) {
+		fprintf(stderr, "%" PRIx64 ": Section size not a multiple of 4\n",
+			pc);
+		err =3D -EINVAL;
+		sz -=3D (sz % 4);
+	}
+
+	if (is_ll(le32toh(code[0]))) {
+		fprintf(stderr, "%" PRIx64 ": First instruction in section is an LL\n",
+			pc);
+		err =3D -EINVAL;
+	}
+
+#define advance() (	\
+	code++,		\
+	pc +=3D 4,	\
+	sz -=3D 4		\
+)
+
+	/*
+	 * Skip the first instructionm allowing check_ll to look backwards
+	 * unconditionally.
+	 */
+	advance();
+
+	/* Now scan through the code looking for LL instructions */
+	for (; sz; advance()) {
+		if (is_ll(le32toh(code[0])))
+			err |=3D check_ll(pc, code, sz);
+	}
+
+	return err;
+}
+
+int main(int argc, char *argv[])
+{
+	int vmlinux_fd, status, err, i;
+	const char *vmlinux_path;
+	struct stat st;
+	Elf64_Ehdr *eh;
+	Elf64_Shdr *sh;
+	void *vmlinux;
+
+	status =3D EXIT_FAILURE;
+
+	if (argc < 2) {
+		usage(stderr);
+		goto out_ret;
+	}
+
+	vmlinux_path =3D argv[1];
+	vmlinux_fd =3D open(vmlinux_path, O_RDONLY);
+	if (vmlinux_fd =3D=3D -1) {
+		perror("Unable to open vmlinux");
+		goto out_ret;
+	}
+
+	err =3D fstat(vmlinux_fd, &st);
+	if (err) {
+		perror("Unable to stat vmlinux");
+		goto out_close;
+	}
+
+	vmlinux =3D mmap(NULL, st.st_size, PROT_READ, MAP_PRIVATE, vmlinux_fd, 0)=
;
+	if (vmlinux =3D=3D MAP_FAILED) {
+		perror("Unable to mmap vmlinux");
+		goto out_close;
+	}
+
+	eh =3D vmlinux;
+	if (memcmp(eh->e_ident, ELFMAG, SELFMAG)) {
+		fprintf(stderr, "vmlinux is not an ELF?\n");
+		goto out_munmap;
+	}
+
+	if (eh->e_ident[EI_CLASS] !=3D ELFCLASS64) {
+		fprintf(stderr, "vmlinux is not 64b?\n");
+		goto out_munmap;
+	}
+
+	if (eh->e_ident[EI_DATA] !=3D ELFDATA2LSB) {
+		fprintf(stderr, "vmlinux is not little endian?\n");
+		goto out_munmap;
+	}
+
+	for (i =3D 0; i < le16toh(eh->e_shnum); i++) {
+		sh =3D vmlinux + le64toh(eh->e_shoff) + (i * le16toh(eh->e_shentsize));
+
+		if (sh->sh_type !=3D SHT_PROGBITS)
+			continue;
+		if (!(sh->sh_flags & SHF_EXECINSTR))
+			continue;
+
+		err =3D check_code(le64toh(sh->sh_addr),
+				 vmlinux + le64toh(sh->sh_offset),
+				 le64toh(sh->sh_size));
+		if (err)
+			goto out_munmap;
+	}
+
+	status =3D EXIT_SUCCESS;
+out_munmap:
+	munmap(vmlinux, st.st_size);
+out_close:
+	close(vmlinux_fd);
+out_ret:
+	return status;
+}
--=20
2.23.0

