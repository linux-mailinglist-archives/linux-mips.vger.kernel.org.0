Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C8A408398D
	for <lists+linux-mips@lfdr.de>; Tue,  6 Aug 2019 21:23:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725881AbfHFTXU (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 6 Aug 2019 15:23:20 -0400
Received: from mail-eopbgr770093.outbound.protection.outlook.com ([40.107.77.93]:49123
        "EHLO NAM02-SN1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725798AbfHFTXT (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Tue, 6 Aug 2019 15:23:19 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ODljWnVPIgGT3+0n2G0sDCiBsy2hIhTSln6t+SX+kqk+SlK1+xm/4dnugH3+dsbdD30qzhlEi8yMAe9DwADFzTBQvykbM9U1UP+omcPnHeA/Syj/r7mQKsZy1d/xJk8ZEsycHS1pwP0q6B3RkzrhiX9Pr+oSiqsJ3YKg7kCfEn4HkdW/XmNg5TrULm7VQ42Vo0M8h5tFLbLFrMJBbx5a57GJZaP3E/mLiVmJTnTY6HlUIXIhNAxzx9DCGwQZa84r888EskYJ/PQAOu7LrYcjOrsZPzbeL5Inp9gKoFyf+lmcgH26TAoPxRimGwj/iwniwqsgUosRz9LFtjOefaJofg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NQps5W5d3yxrsQG/Ddl49f/kJGOCF51Mjqt33ohvFnM=;
 b=P084tTiljE+z0Rqg0PqNH/J6WFMt3QYARGu5X1q37JwH/8cFhMonslBqNidkTMfFIWg+7P1NSTROefQUSlVprJQwKyzrzV/0DG1djCeQxvZyae02TrLl975VioCl9LbiuXoQro8U5Da4IKijtfwcaapUqPRLEdMGIAAl7yThmzrZQgyJ02mGpk0mI3bRUkyg+nMq+IjoJsJhuVzyAbYZOOICqdznFacRgh92wLJ6KcRGqwVyE1WB8nL3l6P4ucFXSRz9p5wcdAk/rel09cd1vfqlKHmwf2bCGCuM2hNFc02PTOYT7aRLRHV4+r3+K+5A2Yt1+oI7jskQdaHAnvVPDg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=wavecomp.com;dmarc=pass action=none
 header.from=mips.com;dkim=pass header.d=mips.com;arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wavecomp.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NQps5W5d3yxrsQG/Ddl49f/kJGOCF51Mjqt33ohvFnM=;
 b=EkDPc/VUrr+edqPVBLrrS/daUF+bHidEUUHgtIXQju3oPB7TO1Nm810qyn2GKLJTzXTEHfOTHA9IdVd04rGbTkvBZxZWXpemyntNwlCLQPIzKKj61c/x4AFzFcy5ixTksWexTTpWfNABybO63EPSNUn0QbhV8iXMEU1ylHkspPs=
Received: from MWHPR2201MB1277.namprd22.prod.outlook.com (10.172.60.12) by
 MWHPR2201MB1405.namprd22.prod.outlook.com (10.174.162.143) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2136.14; Tue, 6 Aug 2019 19:23:17 +0000
Received: from MWHPR2201MB1277.namprd22.prod.outlook.com
 ([fe80::f566:bf1f:dcd:862c]) by MWHPR2201MB1277.namprd22.prod.outlook.com
 ([fe80::f566:bf1f:dcd:862c%10]) with mapi id 15.20.2136.018; Tue, 6 Aug 2019
 19:23:17 +0000
From:   Paul Burton <paul.burton@mips.com>
To:     Linus Torvalds <torvalds@linux-foundation.org>
CC:     "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: [GIT PULL] MIPS fixes
Thread-Topic: [GIT PULL] MIPS fixes
Thread-Index: AQHVTIxm9Og6wKGlxkeX1JpSBdqI4g==
Date:   Tue, 6 Aug 2019 19:23:16 +0000
Message-ID: <20190806192315.y2faix6zk5igs2ry@pburton-laptop>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
x-clientproxiedby: BYAPR07CA0044.namprd07.prod.outlook.com
 (2603:10b6:a03:60::21) To MWHPR2201MB1277.namprd22.prod.outlook.com
 (2603:10b6:301:18::12)
user-agent: NeoMutt/20180716
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=pburton@wavecomp.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [12.94.197.246]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 99110533-e1ad-458c-9351-08d71aa38872
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(49563074)(7193020);SRVR:MWHPR2201MB1405;
x-ms-traffictypediagnostic: MWHPR2201MB1405:
x-microsoft-antispam-prvs: <MWHPR2201MB1405CFFFCAD5F4B753E416D9C1D50@MWHPR2201MB1405.namprd22.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 0121F24F22
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(7916004)(366004)(396003)(136003)(39850400004)(376002)(346002)(199004)(189003)(53936002)(4326008)(58126008)(44832011)(102836004)(66556008)(66476007)(6506007)(386003)(26005)(66446008)(66946007)(66616009)(64756008)(52116002)(99936001)(6512007)(14454004)(9686003)(256004)(14444005)(6436002)(2906002)(42882007)(486006)(6486002)(476003)(186003)(316002)(66066001)(7736002)(33716001)(71200400001)(5660300002)(71190400001)(99286004)(81156014)(478600001)(1076003)(25786009)(81166006)(8936002)(305945005)(6116002)(54906003)(3846002)(8676002)(6916009)(68736007);DIR:OUT;SFP:1102;SCL:1;SRVR:MWHPR2201MB1405;H:MWHPR2201MB1277.namprd22.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: wavecomp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: EyFGfx9lXSX/uxNDOi0bR15E6Y8lyCS8EQ+GJwIHj0BCk7yAllYJZ9Wg+JHfDnQ7QF5O7bsYxHUqpEt5hitUPDPiPeaoe2o2hS7B5QyWHl2bs0FOlnjtxZ1A321mRSWDbvmyk6NRQPZ583qF6tK90wPAhhYrWkiDhmcOEvrRZe4b+QbXpPPlpdy6FLPCvQGIeIh2OV5R3ViGPhIe01xGydUHbhMqhdIXVD0A96StwdVnbLIbVreMa5XacpDxHlznp+S2Q9k4EX5zHTVpudRtel7MjxGMQ1Pd1InuSqNhdxufd4Xao30poySYPJLW4yDc/pDhvmcKPrOq+xpYQ1yvoY5i8CVJK+vtRZJr9C/RrAikpmjT4K2sG/MHdot10cP02By1T8UQP5MfwbQoP1Kj/XyH4wYWRmC5+GuKUJ32ATo=
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="vnwuxw2wltltc7m6"
MIME-Version: 1.0
X-OriginatorOrg: mips.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 99110533-e1ad-458c-9351-08d71aa38872
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Aug 2019 19:23:16.8755
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 463607d3-1db3-40a0-8a29-970c56230104
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: pburton@wavecomp.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR2201MB1405
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

--vnwuxw2wltltc7m6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Linus,

Here are a few small MIPS fixes for the 5.3 cycle; please pull.

Thanks,
    Paul


The following changes since commit e5793cd1b5fedb39337cfa62251a25030f526e56:

  MIPS: fix some more fall through errors in arch/mips (2019-07-16 12:40:16 +0100)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/mips/linux.git tags/mips_fixes_5.3_1

for you to fetch changes up to 74034a09267c1f48d5ce7ae4c4a317fac7d43418:

  MIPS: BCM63XX: Mark expected switch fall-through (2019-08-05 18:25:30 -0700)

----------------------------------------------------------------
A few MIPS fixes for 5.3:

- Various switch fall through annotations to fixup warnings & errors
  resulting from -Wimplicit-fallthrough.

- A fix for systems (at least jazz) using an i8253 PIT as clocksource
  when it's not suitably configured.

- Set struct cacheinfo's cpu_map_populated field to true, indicating
  that we filled in cache info detected from cop0 registers & avoiding
  complaints about that info being (intentionally) missing in
  devicetree.

----------------------------------------------------------------
Gustavo A. R. Silva (2):
      MIPS: OProfile: Mark expected switch fall-throughs
      MIPS: BCM63XX: Mark expected switch fall-through

Paul Burton (2):
      MIPS: Annotate fall-through in kvm/emulate.c
      MIPS: Annotate fall-through in Cavium Octeon code

Thomas Bogendoerfer (1):
      MIPS: kernel: only use i8253 clocksource with periodic clockevent

Vladimir Kondratiev (1):
      mips: fix cacheinfo

 arch/mips/cavium-octeon/octeon-usb.c |  1 +
 arch/mips/kernel/cacheinfo.c         |  2 ++
 arch/mips/kernel/i8253.c             |  3 ++-
 arch/mips/kvm/emulate.c              |  1 +
 arch/mips/oprofile/op_model_mipsxx.c | 13 +++++++++++++
 arch/mips/pci/ops-bcm63xx.c          |  1 +
 6 files changed, 20 insertions(+), 1 deletion(-)

--vnwuxw2wltltc7m6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEARYIAB0WIQRgLjeFAZEXQzy86/s+p5+stXUA3QUCXUnTowAKCRA+p5+stXUA
3X/9AP47DF5LgTgDdORTK8agPP9ByfINWN/CLALENUOymXVmUQEAr1wUeEL3JYYh
aHvpOzcZiH1hFTGeKv7Lo2fTGqTEzQE=
=4SQW
-----END PGP SIGNATURE-----

--vnwuxw2wltltc7m6--
