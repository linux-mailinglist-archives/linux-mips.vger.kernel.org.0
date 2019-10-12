Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1A3A6D51EE
	for <lists+linux-mips@lfdr.de>; Sat, 12 Oct 2019 21:04:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729458AbfJLTET (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sat, 12 Oct 2019 15:04:19 -0400
Received: from mail-eopbgr740108.outbound.protection.outlook.com ([40.107.74.108]:36118
        "EHLO NAM01-BN3-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1729324AbfJLTET (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Sat, 12 Oct 2019 15:04:19 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mI2P1+aFLkYbLDkQsYHdpGgy/IM2kkr19gUDg9ZHzFYnWVhsj9IfqjF4SyXtQyZjwrH+il1+pg2ISyjfLwwHE2YzSdVkCY8zcS1bHt1d6Tued5jAa6DCb9cFcdzCR42YwI1dhKkK2z1g+TLcFeWjkmLwAhHC3CjdBK1qQifJYW4wr7lr40YFuwZRBvrOXvjjZ5iGbSOqoX0Yac9ci+esXI+lIebRuNAKsnSCKexSFHfYxQYP01MR3sXLuBiSl3gk6bEZSrCClXJ/9JcQ4ItTCmS5837uRu7/+9IvguFfcuYn0OzfvlEVLhD71vGPxXZp6TeINn55tMln/+uf1JIwAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gyIvOC8tynPUXZDoRFQG5yc95e8stlSjMGNKAQdaZz4=;
 b=dHx52hbln6OQdF0CW+cHVgRAWaTnEXrxIAFsIxjt/aO9tphaKGElMwfu8X4J/cBEG4a3ifEL8mp41XhbUiRMkuSh6R+kLCDxUUdwheKndxTStP6+6QjgQTQ1Tr1oLJ+UsRAxYQXDqD2xVDtl1jxC6hi8qONBLXcOPlU1cXmRegYt848QZpIB14mkEHZKeFS7xx/3zYnN/uGeXJM+ZZ6db7Beo9UM1dOXRlm22aezWdql2LRMd+smH2OAM2R6CRXfw6Ej6pjA39ZgMeOTjitSMEwUBoT1fm96HcLJRl7wUxUdSx+hZRU03uDrwPtC9PAvWPW0JfysDfeWkoqgvc7GPw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wavecomp.com; dmarc=pass action=none header.from=mips.com;
 dkim=pass header.d=mips.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wavecomp.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gyIvOC8tynPUXZDoRFQG5yc95e8stlSjMGNKAQdaZz4=;
 b=WeO588V/FhC2iazrcOvHSdtb6HasEkrduPpIgbxXMq37M58kfbChKdDFnqoV9GbdIp3pzkfjuATfREWRPjWsppSwk+mPRaMGapnx+a1a5jhXb+9W1uGFtrRiH99pUeNgO2TsNkEcgicLLqkFsVTS7XtZJ51PUjtBVaewaEHaWCI=
Received: from MWHPR2201MB1277.namprd22.prod.outlook.com (10.172.60.12) by
 MWHPR2201MB1725.namprd22.prod.outlook.com (10.164.206.155) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2347.17; Sat, 12 Oct 2019 19:04:14 +0000
Received: from MWHPR2201MB1277.namprd22.prod.outlook.com
 ([fe80::c1dc:dba3:230c:e7f0]) by MWHPR2201MB1277.namprd22.prod.outlook.com
 ([fe80::c1dc:dba3:230c:e7f0%8]) with mapi id 15.20.2347.021; Sat, 12 Oct 2019
 19:04:14 +0000
From:   Paul Burton <paul.burton@mips.com>
To:     Linus Torvalds <torvalds@linux-foundation.org>
CC:     "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: [GIT PULL] MIPS fixes
Thread-Topic: [GIT PULL] MIPS fixes
Thread-Index: AQHVgS/WLh8bRoU0Ik2icH8kD9VxjQ==
Date:   Sat, 12 Oct 2019 19:04:14 +0000
Message-ID: <20191012190412.vaazxi325tjnab2d@pburton-laptop>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
x-clientproxiedby: BY5PR13CA0009.namprd13.prod.outlook.com
 (2603:10b6:a03:180::22) To MWHPR2201MB1277.namprd22.prod.outlook.com
 (2603:10b6:301:18::12)
user-agent: NeoMutt/20180716
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=pburton@wavecomp.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [2601:646:8a00:9810:9d6:9cca:ff8c:efe0]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 0aba8659-d7be-4280-dc48-08d74f46f8f8
x-ms-traffictypediagnostic: MWHPR2201MB1725:
x-microsoft-antispam-prvs: <MWHPR2201MB1725A83276148D80EEDF8882C1960@MWHPR2201MB1725.namprd22.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 0188D66E61
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(7916004)(136003)(346002)(366004)(396003)(39840400004)(376002)(189003)(199004)(8676002)(2906002)(6486002)(305945005)(7736002)(6116002)(99286004)(9686003)(14454004)(478600001)(99936001)(316002)(6512007)(58126008)(6436002)(33716001)(66946007)(66446008)(64756008)(66556008)(66476007)(66616009)(81156014)(81166006)(6916009)(71190400001)(71200400001)(386003)(6506007)(256004)(42882007)(8936002)(54906003)(14444005)(5660300002)(4001150100001)(1076003)(186003)(25786009)(44832011)(476003)(102836004)(486006)(52116002)(4326008)(46003);DIR:OUT;SFP:1102;SCL:1;SRVR:MWHPR2201MB1725;H:MWHPR2201MB1277.namprd22.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: wavecomp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: UhI2DkWusF22FSqYR1WtPB3wNYAaQ3mzEzQtoAcmZU4+qTbpYlDcKXzTIAg6eFQTxoxvSDALubrlEnTmQpyncnZL688yq0eMuh7aAOG5zLrLWHRkouCsEnPSgvnQV4oCTJ4phPn1SoWs9GDhHBrGc4bi7z4tlgf28dvLS+7Ye9qd+0l3ypvED+NV+qxLYB2rCALb86VH6LS3AZ14O39gmL5Wy5yk0OrP+SCdZlp4FIYsyfmcYfm8oKP7zt7ZmcdKlZ0HyC5RphByI6Fl0O5eF9ZaJsOhhI4VZoyJ/NQo0Jqy7FjLkg1K5pB1Wtxs5AWEb9ZiXIA3pw7F5nTZQKzYagWprYebki7Vt4M4qW1isv2z3RBt+BotFPm279o1YmmnPuJBOArlZ1KQX9vJBxq+m/BFGD6Jh9Akjofhoe/f/UE=
x-ms-exchange-transport-forked: True
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="swr3tlnyelo3xej2"
MIME-Version: 1.0
X-OriginatorOrg: mips.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0aba8659-d7be-4280-dc48-08d74f46f8f8
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Oct 2019 19:04:14.4736
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 463607d3-1db3-40a0-8a29-970c56230104
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: pJwS6wdh82YktCuOPh5ShKS2jeHYZRjfz0e+pfarzOd0qbbBxJucIBxMAbKunfoLMLfzH39WHz/uniLI6sb2/A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR2201MB1725
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

--swr3tlnyelo3xej2
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Linus,

Here are a few MIPS fixes for 5.4; please pull.

Thanks,
    Paul


The following changes since commit da0c9ea146cbe92b832f1b0f694840ea8eb33cce:

  Linux 5.4-rc2 (2019-10-06 14:27:30 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/mips/linux.git tags/mips_fixes_5.4_2

for you to fetch changes up to 2f2b4fd674cadd8c6b40eb629e140a14db4068fd:

  MIPS: Disable Loongson MMI instructions for kernel build (2019-10-10 11:58:52 -0700)

----------------------------------------------------------------
A few MIPS fixes for 5.4:

- Build fixes for CONFIG_OPTIMIZE_INLINING=y builds in which the
  compiler may choose not to inline __xchg() & __cmpxchg().

- A build fix for Loongson configurations with GCC 9.x.

- Expose some extra HWCAP bits to indicate support for various
  instruction set extensions to userland.

- Fix bad stack access in firmware handling code for old SNI
  RM200/300/400 machines.

----------------------------------------------------------------
Jiaxun Yang (1):
      MIPS: elf_hwcap: Export userspace ASEs

Paul Burton (1):
      MIPS: Disable Loongson MMI instructions for kernel build

Thomas Bogendoerfer (3):
      MIPS: include: Mark __cmpxchg as __always_inline
      MIPS: include: Mark __xchg as __always_inline
      MIPS: fw: sni: Fix out of bounds init of o32 stack

 arch/mips/fw/sni/sniprom.c         |  2 +-
 arch/mips/include/asm/cmpxchg.h    |  9 +++++----
 arch/mips/include/uapi/asm/hwcap.h | 11 +++++++++++
 arch/mips/kernel/cpu-probe.c       | 33 +++++++++++++++++++++++++++++++++
 arch/mips/loongson64/Platform      |  4 ++++
 arch/mips/vdso/Makefile            |  1 +
 6 files changed, 55 insertions(+), 5 deletions(-)

--swr3tlnyelo3xej2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEARYIAB0WIQRgLjeFAZEXQzy86/s+p5+stXUA3QUCXaIjrAAKCRA+p5+stXUA
3VD7AQCzxLBDf/iduWPD6efDg6TS5+eAk7MgVNu2FIagzjXP5wD7BA1efontwijE
CR813los+SEUy8MpWF8bRG7OjHh/yw0=
=OGIZ
-----END PGP SIGNATURE-----

--swr3tlnyelo3xej2--
