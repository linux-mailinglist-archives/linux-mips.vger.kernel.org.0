Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 16E9F39B62
	for <lists+linux-mips@lfdr.de>; Sat,  8 Jun 2019 08:40:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726522AbfFHGkL (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sat, 8 Jun 2019 02:40:11 -0400
Received: from mail-eopbgr730099.outbound.protection.outlook.com ([40.107.73.99]:37376
        "EHLO NAM05-DM3-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725536AbfFHGkL (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Sat, 8 Jun 2019 02:40:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=wavesemi.onmicrosoft.com; s=selector1-wavesemi-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hxV+SQTiYk3EouLhpDKxE+AJY9zKUaU/nSKcLo/uTDk=;
 b=n3W3yoUc6QLehIY3I7ItpenYXCRJRWLTnVqJK4k0yRcPYF4gVfps86UGwbwnIR8nWERD8XDCcmwXZiry4KtJ+UfwvQoTA9748eEzMAWWzTwwwe+hTdcx5/yTX+NiIIOWs3DG/4voRxl6FNSljtsB+3B+YbRdEuyLY27sB6rxOuw=
Received: from MWHPR2201MB1277.namprd22.prod.outlook.com (10.172.60.12) by
 MWHPR2201MB1166.namprd22.prod.outlook.com (10.174.168.38) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1965.15; Sat, 8 Jun 2019 06:40:09 +0000
Received: from MWHPR2201MB1277.namprd22.prod.outlook.com
 ([fe80::6975:b632:c85b:9e40]) by MWHPR2201MB1277.namprd22.prod.outlook.com
 ([fe80::6975:b632:c85b:9e40%2]) with mapi id 15.20.1965.017; Sat, 8 Jun 2019
 06:40:09 +0000
From:   Paul Burton <paul.burton@mips.com>
To:     Linus Torvalds <torvalds@linux-foundation.org>
CC:     "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>
Subject: [GIT PULL] MIPS fixes
Thread-Topic: [GIT PULL] MIPS fixes
Thread-Index: AQHVHcUDrNs9ljjF6kSOJCVpUINl0g==
Date:   Sat, 8 Jun 2019 06:40:08 +0000
Message-ID: <20190608064006.zofqsbrtfftsutjr@pburton-laptop>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
x-clientproxiedby: BY5PR04CA0023.namprd04.prod.outlook.com
 (2603:10b6:a03:1d0::33) To MWHPR2201MB1277.namprd22.prod.outlook.com
 (2603:10b6:301:18::12)
user-agent: NeoMutt/20180716
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=pburton@wavecomp.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [2601:646:8a00:9810:9d6:9cca:ff8c:efe0]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: d59a95a8-9f35-4d4a-760e-08d6ebdc2628
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(49563074)(7193020);SRVR:MWHPR2201MB1166;
x-ms-traffictypediagnostic: MWHPR2201MB1166:
x-microsoft-antispam-prvs: <MWHPR2201MB116627FB903E7FB734BCC175C1110@MWHPR2201MB1166.namprd22.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 0062BDD52C
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(7916004)(39840400004)(346002)(136003)(396003)(366004)(376002)(199004)(189003)(66446008)(71200400001)(9686003)(6486002)(68736007)(478600001)(186003)(6436002)(14444005)(256004)(54906003)(66946007)(14454004)(71190400001)(73956011)(58126008)(6512007)(64756008)(66556008)(66476007)(66616009)(99936001)(6916009)(99286004)(1076003)(386003)(6506007)(52116002)(33716001)(316002)(53936002)(44832011)(486006)(2906002)(4326008)(7736002)(476003)(25786009)(42882007)(8936002)(6116002)(3716004)(8676002)(81166006)(305945005)(46003)(5660300002)(81156014)(102836004);DIR:OUT;SFP:1102;SCL:1;SRVR:MWHPR2201MB1166;H:MWHPR2201MB1277.namprd22.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: wavecomp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: p9XohFoXuK/LNwtguRrOQNBkQ+tl4C2TsHeLnf2AP9Iast66nLoMX4ZA8wTQ4x3sAQAHS9Y7PoYPIQY3NGbT+NnSvotdU1F33+W2aAYLXJacINE0PFrEDI3qomlxqDH6mp9ymMGQ/85j1qbXuUcV+oLrQszxIC4oqG7kvOonVT8xe5FEgHqSPiySXMHizMlhYq4m7Ox09ms/iYp4aX9/g1fBVy+RBKk+gHPS0amQSdYJivNJeVTXcKFaCeG7kzIDnJvwAZuuYZQ8F5ORUx+x/K7Ro8TX3GNxdoT2hXcO5REib3ftxuG5s48AfS2rDhuGOKarm8kpPMv17iR/yiqMWgbkcghJUhvoozRjmzO6DMoDiJkGLE3LZZgM2bZnrtw9nFR7vR248i7X7WEZx5z8Gp+9ewMTcMFs1k4n7vOA3DQ=
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="6nu6jqnqddo3gyxj"
MIME-Version: 1.0
X-OriginatorOrg: mips.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d59a95a8-9f35-4d4a-760e-08d6ebdc2628
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Jun 2019 06:40:09.0096
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 463607d3-1db3-40a0-8a29-970c56230104
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: pburton@wavecomp.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR2201MB1166
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

--6nu6jqnqddo3gyxj
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Linus,

Here's a batch of MIPS fixes for 5.2, nothing particularly scary; please
pull.

Thanks,
    Paul


The following changes since commit a188339ca5a396acc588e5851ed7e19f66b0ebd9:

  Linux 5.2-rc1 (2019-05-19 15:47:09 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/mips/linux.git tags/mips_fixes_5.2_1

for you to fetch changes up to f532beeeff0c0a3586cc15538bc52d249eb19e7c:

  MIPS: uprobes: remove set but not used variable 'epc' (2019-05-29 13:20:30 -0700)

----------------------------------------------------------------
A batch of MIPS fixes:

- Declare ginvt() __always_inline due to its use of an argument as an
  inline asm immediate.

- A VDSO build fix following Kbuild changes made this cycle.

- A fix for boot failures on txx9 systems following memory
  initialization changes made this cycle.

- Bounds check virt_addr_valid() to prevent it spuriously indicating
  that bogus addresses are valid, in turn fixing hardened usercopy
  failures that have been present since v4.12.

- Build uImage.gz for pistachio systems by default, since this is the
  image we need in order to actually boot on a board.

- Remove an unused variable in our uprobes code.

----------------------------------------------------------------
Geert Uytterhoeven (1):
      MIPS: TXx9: Fix boot crash in free_initmem()

Masahiro Yamada (2):
      MIPS: mark ginvt() as __always_inline
      MIPS: remove a space after -I to cope with header search paths for VDSO

Paul Burton (3):
      MIPS: Bounds check virt_addr_valid
      MIPS: Make virt_addr_valid() return bool
      MIPS: pistachio: Build uImage.gz by default

YueHaibing (1):
      MIPS: uprobes: remove set but not used variable 'epc'

 arch/mips/include/asm/ginvt.h  | 2 +-
 arch/mips/include/asm/page.h   | 2 +-
 arch/mips/kernel/uprobes.c     | 3 ---
 arch/mips/mm/mmap.c            | 7 ++++++-
 arch/mips/pistachio/Platform   | 1 +
 arch/mips/pnx833x/Platform     | 2 +-
 arch/mips/txx9/generic/setup.c | 6 ------
 7 files changed, 10 insertions(+), 13 deletions(-)

--6nu6jqnqddo3gyxj
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEARYIAB0WIQRgLjeFAZEXQzy86/s+p5+stXUA3QUCXPtYRgAKCRA+p5+stXUA
3T/8APoChIaknnoRdHZCwCUJGyg0HVZBwIxtB3JB3Rf3lJOCTgEAoOzlPgpeude/
/JN5XW6PQr6+kaRrd6e1HHM55Q3EYQo=
=BZKz
-----END PGP SIGNATURE-----

--6nu6jqnqddo3gyxj--
