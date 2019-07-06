Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 499A961228
	for <lists+linux-mips@lfdr.de>; Sat,  6 Jul 2019 18:24:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725945AbfGFQYB (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sat, 6 Jul 2019 12:24:01 -0400
Received: from mail-eopbgr820123.outbound.protection.outlook.com ([40.107.82.123]:24504
        "EHLO NAM01-SN1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726522AbfGFQYB (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Sat, 6 Jul 2019 12:24:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=wavesemi.onmicrosoft.com; s=selector1-wavesemi-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4SJj09mkhZKhCos/jfVKyJqtSHNLfCBE2NPOYdlsL94=;
 b=QKqRGA7Itlb66IfzA6qWViayWzg1hhWQZA/yo+dcLtJMSo2fX7zzbc7OOLt4IWyKhLoaI/XLAA1EzmllJmYTSe9XhuV1eT6W6TwCpG3fhXeVx0VbrlzI/ZVA1/f88mvgEpWj7EhjTx3k8q7bV7EfpMjhwcNV36pdGrDkaBVumCE=
Received: from MWHPR2201MB1277.namprd22.prod.outlook.com (10.172.60.12) by
 MWHPR2201MB1325.namprd22.prod.outlook.com (10.172.60.23) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2052.17; Sat, 6 Jul 2019 16:23:57 +0000
Received: from MWHPR2201MB1277.namprd22.prod.outlook.com
 ([fe80::746d:883d:31:522e]) by MWHPR2201MB1277.namprd22.prod.outlook.com
 ([fe80::746d:883d:31:522e%5]) with mapi id 15.20.2052.019; Sat, 6 Jul 2019
 16:23:57 +0000
From:   Paul Burton <paul.burton@mips.com>
To:     Linus Torvalds <torvalds@linux-foundation.org>
CC:     "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>
Subject: [GIT PULL] MIPS fixes
Thread-Topic: [GIT PULL] MIPS fixes
Thread-Index: AQHVNBc1hSVSr+AmPkKmbakhcJ9Ddw==
Date:   Sat, 6 Jul 2019 16:23:57 +0000
Message-ID: <20190706162350.4tyzj44jppjb4hwq@pburton-laptop>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
x-clientproxiedby: AM5PR06CA0032.eurprd06.prod.outlook.com
 (2603:10a6:206:2::45) To MWHPR2201MB1277.namprd22.prod.outlook.com
 (2603:10b6:301:18::12)
user-agent: NeoMutt/20180716
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=pburton@wavecomp.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [46.233.116.40]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 04900152-5ef8-4f5f-9f8a-08d7022e5846
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(49563074)(7193020);SRVR:MWHPR2201MB1325;
x-ms-traffictypediagnostic: MWHPR2201MB1325:
x-microsoft-antispam-prvs: <MWHPR2201MB132535FC2496D8DDDFF66F45C1F40@MWHPR2201MB1325.namprd22.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4502;
x-forefront-prvs: 00909363D5
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(7916004)(366004)(346002)(376002)(39830400003)(396003)(136003)(189003)(199004)(54906003)(186003)(68736007)(476003)(102836004)(6436002)(486006)(8936002)(66066001)(52116002)(58126008)(99936001)(33716001)(26005)(316002)(99286004)(25786009)(6116002)(3846002)(71190400001)(14454004)(478600001)(6486002)(1076003)(81166006)(81156014)(14444005)(256004)(6506007)(386003)(2906002)(305945005)(5660300002)(42882007)(53936002)(6512007)(64756008)(66946007)(8676002)(9686003)(4326008)(66476007)(7736002)(66446008)(44832011)(66556008)(71200400001)(6916009)(66616009)(73956011);DIR:OUT;SFP:1102;SCL:1;SRVR:MWHPR2201MB1325;H:MWHPR2201MB1277.namprd22.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: wavecomp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: l5ayjxd8R+YWuijbOFL5SpF/X6DScM9fJ2A7LEy0bC6cFfrh1oOAveAS70j+/xJnMFCx0R+3X2spo+gVtxw+ZiquuMQF5JYGI1YCqcQksliPoe2kN79wYgwblP/s+duKXRkBip6JPx0O2UOhzGDIk60N6jBIc6RlNMNOS2IBLO5siceuNeiQ1MKPF9Xyvi+O5khB7EJqRmv1Qc6R9QE5jUVkOf1HFb6jiizkqm8s1ts0xy+XjgOHdbO1jrIT2or6vOl6nMFcX42KnVuL0DXITDBsA8k8cPr14gGg8Mzb12iseRAuIfvu4iRSjApMZQrXSA9iXCWDDoHyeQhoXGKvdIy7jXVD8PturDJVsbkZ3dQx5kxmK+49ff6rY7wLJEdyigktuIX3BwQ1qt2Qi6N+dGM7+0hrDiRIrG4t89gdtRQ=
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="mxxb6aqztjohx32p"
MIME-Version: 1.0
X-OriginatorOrg: mips.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 04900152-5ef8-4f5f-9f8a-08d7022e5846
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Jul 2019 16:23:57.1060
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 463607d3-1db3-40a0-8a29-970c56230104
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: pburton@wavecomp.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR2201MB1325
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

--mxxb6aqztjohx32p
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Linus,

Apologies that these are arriving so late in the game, but here are a
few MIPS fixes heading your way from a beachside cafe. It's all pretty
small, nothing too scary or invasive. Please pull.

Thanks,
    Paul


The following changes since commit 9e0babf2c06c73cda2c0cd37a1653d823adb40ec:

  Linux 5.2-rc5 (2019-06-16 08:49:45 -1000)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/mips/linux.git tags/mips_fixes_5.2_2

for you to fetch changes up to f2ff671f894151a611eae246a1f25b61d6c0354b:

  MAINTAINERS: Correct path to moved files (2019-06-24 14:45:41 -0700)

----------------------------------------------------------------
A few more MIPS fixes:

- Fix a silly typo in virt_addr_valid which led to completely bogus
  behavior (that happened to stop tripping up hardened usercopy despite
  being broken).

- Fix UART parity setup on AR933x systems.

- A build fix for non-Linux build machines.

- Have the 'all' make target build DTBs, primarily to fit in with the
  behavior of scripts/package/builddeb.

- Handle an execution hazard in TLB exceptions that use KScratch
  registers, which could inadvertently clobber the $1 register on some
  generally higher-end out-of-order CPUs.

- A MAINTAINERS update to fix the path to the NAND driver for Ingenic
  systems.

----------------------------------------------------------------
Cedric Hombourger (1):
      MIPS: have "plain" make calls build dtbs for selected platforms

Dmitry Korotin (1):
      MIPS: Add missing EHB in mtc0 -> mfc0 sequence.

Hauke Mehrtens (1):
      MIPS: Fix bounds check virt_addr_valid

Kevin Darbyshire-Bryant (1):
      MIPS: fix build on non-linux hosts

Paul Cercueil (1):
      MAINTAINERS: Correct path to moved files

Stefan Hellermann (1):
      MIPS: ath79: fix ar933x uart parity mode

 MAINTAINERS                                        |  2 +-
 arch/mips/Makefile                                 |  3 ++-
 arch/mips/boot/compressed/Makefile                 |  2 ++
 arch/mips/boot/compressed/calc_vmlinuz_load_addr.c |  2 +-
 arch/mips/include/asm/mach-ath79/ar933x_uart.h     |  4 +--
 arch/mips/mm/mmap.c                                |  2 +-
 arch/mips/mm/tlbex.c                               | 29 +++++++++++++++-------
 7 files changed, 29 insertions(+), 15 deletions(-)

--mxxb6aqztjohx32p
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEARYIAB0WIQRgLjeFAZEXQzy86/s+p5+stXUA3QUCXSDLFgAKCRA+p5+stXUA
3QfdAP9Jluo6qDB8iSnoNKp9kN7D/iw7jL8Sz3k8FLuV/x27TwEA5G8Y0c+0vqtU
v5+OMCp4Ec1CGASzPhggFgpw57gkVgo=
=hvjf
-----END PGP SIGNATURE-----

--mxxb6aqztjohx32p--
