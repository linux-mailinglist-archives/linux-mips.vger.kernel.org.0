Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A755851A1A
	for <lists+linux-mips@lfdr.de>; Mon, 24 Jun 2019 19:56:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726451AbfFXR4A (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 24 Jun 2019 13:56:00 -0400
Received: from mail-eopbgr760102.outbound.protection.outlook.com ([40.107.76.102]:42734
        "EHLO NAM02-CY1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726331AbfFXRz7 (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Mon, 24 Jun 2019 13:55:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=wavesemi.onmicrosoft.com; s=selector1-wavesemi-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1JDTDg5TozyJucYz11eATMtqOa/5N29m/gjcso1NWSw=;
 b=M4HQ4wMbaJn7InzezNLgdv2mZDntkXna0OYIfLjRrxJ9gTfNlhCgwE6CE9skmD+1u8C2vQSNbQdaPz+ml/sCUrqjbvJBmLzOeSrbQPOiHTNOlm2VixeDsaP5E45OLhEW+b4KX4Ktil5DNphySUjG4mniuuslmv7+ILk2RL5zwWI=
Received: from MWHPR2201MB1277.namprd22.prod.outlook.com (10.172.60.12) by
 MWHPR2201MB1117.namprd22.prod.outlook.com (10.174.169.155) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2008.16; Mon, 24 Jun 2019 17:55:56 +0000
Received: from MWHPR2201MB1277.namprd22.prod.outlook.com
 ([fe80::6975:b632:c85b:9e40]) by MWHPR2201MB1277.namprd22.prod.outlook.com
 ([fe80::6975:b632:c85b:9e40%2]) with mapi id 15.20.2008.014; Mon, 24 Jun 2019
 17:55:56 +0000
From:   Paul Burton <paul.burton@mips.com>
To:     Carlo Pisani <carlojpisani@gmail.com>,
        Thomas Bogendoerfer <tbogendoerfer@suse.de>,
        "Maciej W. Rozycki" <macro@linux-mips.org>,
        Joshua Kinard <kumba@gentoo.org>
CC:     "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>
Subject: Re: SGI-IP30
Thread-Topic: SGI-IP30
Thread-Index: AQHVKPf2fcS7+eqlcUaD0P2qPxxMgaarGjIA
Date:   Mon, 24 Jun 2019 17:55:55 +0000
Message-ID: <20190624175553.2tpepq5zsamovrra@pburton-laptop>
References: <b201c33a-5beb-3dfb-b99b-d9b8fc6c2c64@hauke-m.de>
 <CA+QBN9A3JmvfCZkXZ2-Yd=nkQCQD48OgYEpe+Po4MuZFpmnPrQ@mail.gmail.com>
In-Reply-To: <CA+QBN9A3JmvfCZkXZ2-Yd=nkQCQD48OgYEpe+Po4MuZFpmnPrQ@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: BYAPR21CA0016.namprd21.prod.outlook.com
 (2603:10b6:a03:114::26) To MWHPR2201MB1277.namprd22.prod.outlook.com
 (2603:10b6:301:18::12)
user-agent: NeoMutt/20180716
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=pburton@wavecomp.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [12.94.197.246]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 74c729af-d0cc-4fac-2b3c-08d6f8cd34b0
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);SRVR:MWHPR2201MB1117;
x-ms-traffictypediagnostic: MWHPR2201MB1117:
x-ms-exchange-purlcount: 1
x-microsoft-antispam-prvs: <MWHPR2201MB111728CB646AF1BA4A606548C1E00@MWHPR2201MB1117.namprd22.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6790;
x-forefront-prvs: 007814487B
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(7916004)(136003)(346002)(376002)(396003)(39840400004)(366004)(189003)(199004)(229853002)(2906002)(44832011)(486006)(476003)(52116002)(14444005)(256004)(966005)(5660300002)(66446008)(73956011)(33716001)(66946007)(99286004)(6116002)(14454004)(3846002)(4744005)(6486002)(6306002)(6246003)(68736007)(81166006)(81156014)(316002)(6436002)(305945005)(4326008)(53936002)(7736002)(478600001)(8676002)(66476007)(66556008)(1076003)(64756008)(8936002)(9686003)(6512007)(71190400001)(71200400001)(386003)(26005)(186003)(102836004)(11346002)(6506007)(76176011)(58126008)(110136005)(446003)(42882007)(25786009)(66066001);DIR:OUT;SFP:1102;SCL:1;SRVR:MWHPR2201MB1117;H:MWHPR2201MB1277.namprd22.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: wavecomp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: Uyb5ZROE7CZLmH3NSH+qXeFQaPkBjDzU7BdBtUf/eDkFCFSjTBmM2K+8egdTW59koLmFHWDy8xkaDmOMl5/4aBiOEe6UL/zAwelSvOCTwrA4t2qeZyw5XajjZenJBvprg+D9036/nX3aWXF3FXi2g2g7udnqcRGZQNakRweH+d3mZUYJvbkcDnDMGne11OW+u2Ix/ZoBNnBE+zGo1FPHpgDhZiokhNvvbhMkYiL32S9CJAtXbkq7cQcWL+g6uGVSu/KndPgPaD/p/jNmp2nO0mlcro5An7dklN92qRdaCwHZs9IkgscjfLXhUGWIewpvaGX8I/6sljoU58fdKAGG/N8/ASpltURRmoHF4bpWhuMlczRdo4EYo/7pv9AiuPyeMMsGYs+BSQHGImA8Ifjel2YN0bA0Kf9gTKIjFwq0jJU=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <754A0ED2B934DD4C89B5F1950F7F5D83@namprd22.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: mips.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 74c729af-d0cc-4fac-2b3c-08d6f8cd34b0
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Jun 2019 17:55:55.9360
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 463607d3-1db3-40a0-8a29-970c56230104
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: pburton@wavecomp.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR2201MB1117
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi Carlo,

On Sat, Jun 22, 2019 at 02:42:05PM +0200, Carlo Pisani wrote:
> hi guys
> I am new on this mailing list, is there anyone on SGI-IP30?
> I am with kernel 4.18, there are a few quirks ... with the SMP
>=20
> =3D)

Since we don't have IP30 support upstream I presume you must be getting
your kernel source from somewhere else?

I'm afraid I don't have access to any of these old SGI systems myself,
but your best chances are probably:

- Thomas Bodendoerfer who's recently done some work refactoring IP27
  code in an effort to also support IP30 & other systems.

- Maciej W. Rozycki who seems to have an affinity for MIPS machines from
  this era, or at least plenty of knowledge about them :)

- Joshua Kinard who had SMP issues with IP30 over here:
  https://lore.kernel.org/linux-mips/5457187D.6030708@gentoo.org/T/#u
  That was 5 years ago though, so may be a long shot!

Thanks,
    Paul
