Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 06EE2B167C
	for <lists+linux-mips@lfdr.de>; Fri, 13 Sep 2019 00:53:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726822AbfILWxs (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 12 Sep 2019 18:53:48 -0400
Received: from mail-eopbgr700091.outbound.protection.outlook.com ([40.107.70.91]:17857
        "EHLO NAM04-SN1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726754AbfILWxs (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Thu, 12 Sep 2019 18:53:48 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AXUQiovd106st/HGvhzdVXC39S5KnvxKf8kLRw+RPzVtOm5CFpfLyJPeDOkp4eESsS/S34QSsSQudqqTdLk2hiRAO3YnUgVBzqizqJRPL5L0Fp48PG+P5Vf2epkKMO3hjqLNE2ucWDULvtmyEqqvBU4f/nOlYTqNmhp6nO+0A1ot8OMAUEDgs9EOdoG9u+FPgYwj64PXVJK7d7v42s/4j4SXkhG5Jkopp2r3cx3NORjlst7tWYwW4fAdQaZ50EzejySyHrEmuABBQxHSEhLN2egH6d0ObAdU6vPrqarwPKTjosIdc8va2BdZt0x7KpJNQqWyGKKP5JkZxhEeBpIisA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=smiJ3KxWYKhPbObVxMXVZrGAr3b8Bk8xPhUIjJ0wQfw=;
 b=nZ8z+wx4abr6/AKMG/QqcO2UD3zG66YeTJHN+Utz426IVY/xnQyjlL9Rur/2avSVTa01CfHXjHZTx0shUj2U5jjBa6u9PxQfOH2hMzcUcwvfM5po83cRb/gT3ZnasNDWgMpc23HZvcTilWylGWPvPgeyebBgQx751ZuecHJMCaQCIXO0OBv54/e1WE5LhYWZMRQJtERYZxyQxH+cBi1nEEs8QuB6qp+92+LTQm2n/8mo/h33H4XJorT5yM9MmAYtA+oZv4ihQ9JJwPlzqBybdR8s05+52lbCgUAfkG+i9My2j4eDJOay4jKXL8wrLTUENPC+L+gc7PBnVnJbO9uRdg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wavecomp.com; dmarc=pass action=none header.from=wavecomp.com;
 dkim=pass header.d=wavecomp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wavecomp.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=smiJ3KxWYKhPbObVxMXVZrGAr3b8Bk8xPhUIjJ0wQfw=;
 b=gKitjCsPh/UrTDZMhxU7tNhnl8AVRqubEGrTeKOhKOzD8SPhW6iwv011aZrarq3PpdLLQ9C4qomY6JRPG5w/e43tdbNBgZBqWErkf6ArznbUAYtLaYLZoa29sKdqQn4PSJFVCEGC0QOoDUoRHwwmNyrqrmkTVPIjee+y899dmAA=
Received: from CY4PR22MB0471.namprd22.prod.outlook.com (10.173.191.12) by
 CY4PR22MB0775.namprd22.prod.outlook.com (10.171.168.16) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2263.13; Thu, 12 Sep 2019 22:53:45 +0000
Received: from CY4PR22MB0471.namprd22.prod.outlook.com
 ([fe80::48d:cca7:a463:a297]) by CY4PR22MB0471.namprd22.prod.outlook.com
 ([fe80::48d:cca7:a463:a297%3]) with mapi id 15.20.2241.022; Thu, 12 Sep 2019
 22:53:45 +0000
From:   Dmitry Korotin <dkorotin@wavecomp.com>
To:     Paul Burton <pburton@wavecomp.com>
CC:     "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
        Dmitry Korotin <dkorotin@wavecomp.com>
Subject: [PATCH] mips: Kconfig: Add ARCH_HAS_FORTIFY_SOURCE
Thread-Topic: [PATCH] mips: Kconfig: Add ARCH_HAS_FORTIFY_SOURCE
Thread-Index: AQHVabzu21vL1CNsKkWTvmtyhwNF4Q==
Date:   Thu, 12 Sep 2019 22:53:45 +0000
Message-ID: <CY4PR22MB04717E7C68389573AADA4E99AFB00@CY4PR22MB0471.namprd22.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: BY5PR03CA0019.namprd03.prod.outlook.com
 (2603:10b6:a03:1e0::29) To CY4PR22MB0471.namprd22.prod.outlook.com
 (2603:10b6:903:b6::12)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=dkorotin@wavecomp.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [216.35.128.4]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 9b3de4cc-c5ab-4ba8-8a48-08d737d4102a
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(2017052603328)(7193020);SRVR:CY4PR22MB0775;
x-ms-traffictypediagnostic: CY4PR22MB0775:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <CY4PR22MB0775FF89DC2C55F59B496465AFB00@CY4PR22MB0775.namprd22.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3276;
x-forefront-prvs: 01583E185C
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(136003)(366004)(346002)(39840400004)(396003)(376002)(199004)(189003)(2906002)(256004)(66066001)(8936002)(102836004)(486006)(476003)(186003)(26005)(6506007)(386003)(33656002)(66446008)(66556008)(64756008)(66946007)(66476007)(55016002)(9686003)(5660300002)(52536014)(86362001)(14454004)(6116002)(3846002)(478600001)(107886003)(6862004)(53936002)(4326008)(25786009)(6636002)(74316002)(52116002)(7696005)(7736002)(316002)(81166006)(71200400001)(71190400001)(6436002)(99286004)(54906003)(8676002)(81156014)(305945005);DIR:OUT;SFP:1102;SCL:1;SRVR:CY4PR22MB0775;H:CY4PR22MB0471.namprd22.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: wavecomp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: /2rX5RhkEg5vc8AfGYmO4t12XAKWcZ2+DzwgPPmJ1TnWpH5UZfVu5CARGljjIZUul8ki125h3G8suI24+mU8GRqDrRQjZvA6zV4/nOVM2mImYzx7ShMFt456WjgIpyCHSSkXroyMrelPKQK1LIyimeLBQjFIcQFMhgSn8zL8PgyoRX8t6Dr7SoS+dwYlJECSZm3MUHUZWswqjr7OhIOnLRkKhNvOYFGTN+gMWzWr26GuN9gN78YJi6x0pCnxWdSS2iqxRh1g/zgEl4lMlOhJnnQQCHFFoezjeaKnfjRt3iIEHdGpLoU7q6B1Aq7hy6GV8HCPkZr4LHOyzfntYdvbAZepIY3pQxWfeecIWat+CwStRc/pnstpCqFF0vTiD/pgcPBms7rB/bn4GfHIZLV0ohxj3aJ52bYOxEKBoSNMUBU=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: wavecomp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9b3de4cc-c5ab-4ba8-8a48-08d737d4102a
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Sep 2019 22:53:45.2206
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 463607d3-1db3-40a0-8a29-970c56230104
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: EWi6aw7VvOcSc5zcsef6B6AdjycI4X0b8zqbzLJZkKcNxnhp+cklUFmlokSn/sq8zW9XSIaeoAxKJJcOxID8ow==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR22MB0775
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

FORTIFY_SOURCE detects various overflows at compile and run time.
(6974f0c4555e ("include/linux/string.h:
add the option of fortified string.h functions)

ARCH_HAS_FORTIFY_SOURCE means that the architecture can be built and
run with CONFIG_FORTIFY_SOURCE.

Since mips can be built and run with that flag,
select ARCH_HAS_FORTIFY_SOURCE as default.

Signed-off-by: Dmitry Korotin <dkorotin@wavecomp.com>
---
 arch/mips/Kconfig              |    1 +
 arch/mips/include/asm/string.h |    2 ++
 2 files changed, 3 insertions(+), 0 deletions(-)

diff --git a/arch/mips/Kconfig b/arch/mips/Kconfig
index d50fafd..63d608f 100644
--- a/arch/mips/Kconfig
+++ b/arch/mips/Kconfig
@@ -8,6 +8,7 @@ config MIPS
 	select ARCH_HAS_ELF_RANDOMIZE
 	select ARCH_HAS_TICK_BROADCAST if GENERIC_CLOCKEVENTS_BROADCAST
 	select ARCH_HAS_UBSAN_SANITIZE_ALL
+	select ARCH_HAS_FORTIFY_SOURCE
 	select ARCH_SUPPORTS_UPROBES
 	select ARCH_USE_BUILTIN_BSWAP
 	select ARCH_USE_CMPXCHG_LOCKREF if 64BIT
diff --git a/arch/mips/include/asm/string.h b/arch/mips/include/asm/string.=
h
index 29030cb..4b938c5 100644
--- a/arch/mips/include/asm/string.h
+++ b/arch/mips/include/asm/string.h
@@ -10,6 +10,7 @@
 #ifndef _ASM_STRING_H
 #define _ASM_STRING_H
=20
+#if !defined(__OPTIMIZE__) || !defined(CONFIG_FORTIFY_SOURCE)
=20
 /*
  * Most of the inline functions are rather naive implementations so I just
@@ -130,6 +131,7 @@ static __inline__ int strcmp(__const__ char *__cs, __co=
nst__ char *__ct)
 	return __res;
 }
 #endif /* CONFIG_32BIT */
+#endif /* !defined(__OPTIMIZE__) || !defined(CONFIG_FORTIFY_SOURCE) */
=20
 #define __HAVE_ARCH_MEMSET
 extern void *memset(void *__s, int __c, size_t __count);
--=20
1.7.1

