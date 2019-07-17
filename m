Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 479E66C25E
	for <lists+linux-mips@lfdr.de>; Wed, 17 Jul 2019 22:58:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726598AbfGQU6T (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 17 Jul 2019 16:58:19 -0400
Received: from mail-eopbgr690136.outbound.protection.outlook.com ([40.107.69.136]:30785
        "EHLO NAM04-CO1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726063AbfGQU6T (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Wed, 17 Jul 2019 16:58:19 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lBZgMPW/iixJxF7iaqN0f9aYFbx5LDPJmHwTW8cCf5Ljlybq2ZeGFeg7zJCFp5Nmd/xQ0U33ibdDrZIk/itOlOsvtEQFK9fdpuihKM9/E01KSwX8jrCzD9RRl/GKlYquBawsM0Qhl30i9YzkTzhlFV9gC5mQ1VKHUwkgwmN6mWePIaeAyFUc6/Jam6yqaocTq19dWh1HjxEr5Vmh4M06O9hFN/ok8XPUIDC1rdfw33nzpAvItb1UATafjXwd+LpkoQVXlGvKVIfoZnMATMf4+itDomWSoIfncHQgUh6XeNkDJvtjW0qhqom0CWgI2IxVLtpr5gs4X2qNz3rac5rgPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xFfr36gWKFim0AmMEBMHPVCAYealNgMI9pTYz1XAD8A=;
 b=CkE578MtHZgxx6tANCJB5Gxokp1/kahIdjOim/bNl95ffnw4mliDzUEnLmeN5jMO8AZgp20hY4Wq5lyqTK+4aQIh8mIF2FDJ2q1T8j5rYL+jUtNOwfvtEipJiNF/S8cq5f3BGKw9liJA6I8u8bHkD0JF+5tH4a70iicV23XukqGcM9o3WfolOGlTfASAg+Tfise8wH/LxfWZ/x9fYwXPrA7o/yqELXVB2tImXGNxj/8Gf4yTcduKyHwX8fyXpCkqPDRtGOPi5P7wG9KP6gK02YE62isbuyckZSVJ0IG0NPk2BFJKmHBOZxsNrEN5IXo3SHp9/MUcjkT7sG21ZULX9w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=wavecomp.com;dmarc=pass action=none
 header.from=mips.com;dkim=pass header.d=mips.com;arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=wavesemi.onmicrosoft.com; s=selector1-wavesemi-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xFfr36gWKFim0AmMEBMHPVCAYealNgMI9pTYz1XAD8A=;
 b=CoIOu5b2KpmzMwvsw/Tvidd5JAc/ZnkCXHkG++fGRzIOSorTGfqzilk8g02pDZMzYCl+bq1gmQSSY2z5M2IkEf5DgBDbcKcE3SeF21u01OUA5f1exyGYkjkOa0S1x2jDV+bPOJsCnSj0QDnhOnpgjzz1KQkLrhyfOVY1oZ+hW2s=
Received: from MWHPR2201MB1277.namprd22.prod.outlook.com (10.172.60.12) by
 MWHPR2201MB1549.namprd22.prod.outlook.com (10.174.170.162) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2094.11; Wed, 17 Jul 2019 20:58:17 +0000
Received: from MWHPR2201MB1277.namprd22.prod.outlook.com
 ([fe80::746d:883d:31:522e]) by MWHPR2201MB1277.namprd22.prod.outlook.com
 ([fe80::746d:883d:31:522e%5]) with mapi id 15.20.2073.012; Wed, 17 Jul 2019
 20:58:16 +0000
From:   Paul Burton <paul.burton@mips.com>
To:     =?iso-8859-1?Q?Philippe_Mathieu-Daud=E9?= <f4bug@amsat.org>
CC:     "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
        Paolo Bonzini <pbonzini@redhat.com>,
        =?iso-8859-1?Q?Herv=E9_Poussineau?= <hpoussin@reactos.org>,
        Aleksandar Markovic <amarkovic@wavecomp.com>,
        Aurelien Jarno <aurelien@aurel32.net>,
        Aleksandar Rikalo <arikalo@wavecomp.com>,
        Thomas Huth <thuth@redhat.com>,
        Peter Maydell <peter.maydell@linaro.org>,
        Artyom Tarasenko <atar4qemu@gmail.com>,
        Ralf Baechle <ralf@linux-mips.org>,
        James Hogan <jhogan@kernel.org>,
        "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>
Subject: Re: [RFC PATCH 10/10] hw/pci-host/gt64120: Clean the decoded address
 space
Thread-Topic: [RFC PATCH 10/10] hw/pci-host/gt64120: Clean the decoded address
 space
Thread-Index: AQHVMDe0AxUJbJalrkypsvYZt/0scabPZESA
Date:   Wed, 17 Jul 2019 20:58:16 +0000
Message-ID: <20190717205815.3kx45uxu3ahv4q77@pburton-laptop>
References: <20190624222844.26584-1-f4bug@amsat.org>
 <20190624222844.26584-11-f4bug@amsat.org>
 <4fab5459-f1a6-8ac9-2498-bda6a4732a1c@amsat.org>
In-Reply-To: <4fab5459-f1a6-8ac9-2498-bda6a4732a1c@amsat.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: BY5PR16CA0005.namprd16.prod.outlook.com
 (2603:10b6:a03:1a0::18) To MWHPR2201MB1277.namprd22.prod.outlook.com
 (2603:10b6:301:18::12)
user-agent: NeoMutt/20180716
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=pburton@wavecomp.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [12.94.197.246]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 8f9ff55a-9203-475e-80d0-08d70af97d9c
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);SRVR:MWHPR2201MB1549;
x-ms-traffictypediagnostic: MWHPR2201MB1549:
x-microsoft-antispam-prvs: <MWHPR2201MB1549A2004BEDC34DD213158CC1C90@MWHPR2201MB1549.namprd22.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-forefront-prvs: 01018CB5B3
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(7916004)(39840400004)(136003)(346002)(396003)(376002)(366004)(189003)(199004)(229853002)(52116002)(256004)(53936002)(7416002)(26005)(6512007)(3846002)(9686003)(6116002)(14444005)(8676002)(66446008)(66556008)(66946007)(66476007)(2906002)(76176011)(64756008)(6486002)(8936002)(476003)(68736007)(14454004)(11346002)(6436002)(7736002)(4326008)(186003)(305945005)(6916009)(6506007)(102836004)(81166006)(81156014)(6246003)(42882007)(386003)(478600001)(33716001)(446003)(44832011)(25786009)(486006)(66066001)(316002)(58126008)(54906003)(5660300002)(4744005)(99286004)(71190400001)(71200400001)(1076003);DIR:OUT;SFP:1102;SCL:1;SRVR:MWHPR2201MB1549;H:MWHPR2201MB1277.namprd22.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: wavecomp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: lwQV+hfwNvGE6aMI8ZaM5ebLja0TCR+VaEbJ1oriOG2zzh8o8qCN3QNytygPyUPvucH/2btIcM5r8SPhGlgiKOhB4SI2C0f9UQTgOQEE0oPPvV7fk55LvY9qB3cdvXKoRX3x3KE4GWFCU816q2XH90in5gDkacJ80SoXVyIA9nFkgs/AGGVZFiQ4ppMNNsVOzTgZWKuUU7p4l0tsBy8rnNyyHQeeYijX3cWCncleKgnrB7ti0njltPe42SHhxSUgL16v0gRAN7KaqZZE4QgWzTul/bSjtiMGgDvaVKb+Kd7rUOYxz7+IxcpV0t14SXXQwhiwg4AFaVsjQoUyuT4a0G+caQFLi8tbbg7o/S3vgZOBNBSXTDFOaXn6Lp75ROGYBc1w1Qut60/IQwYAmCPuGJmG5oIPZNwFTqcbZgsDQfc=
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <5E79C907D7D0164DA83D665DFF3D1187@namprd22.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: mips.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8f9ff55a-9203-475e-80d0-08d70af97d9c
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Jul 2019 20:58:16.8448
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 463607d3-1db3-40a0-8a29-970c56230104
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: pburton@wavecomp.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR2201MB1549
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi Philippe,

Sorry for the delay; I was away for a few weeks visiting family.

On Mon, Jul 01, 2019 at 08:06:21PM +0200, Philippe Mathieu-Daud=E9 wrote:
> The difference with the previous content is now we have
> two new holes:
>=20
> - 0x02000000-0x10000000
> - 0x14001000-0x1c000000
>=20
> Ralf/Paul/James, what should happen when a guest access these
> holes (hardware PoV, no QEMU)?

I don't have a Malta handy to check (they're mostly "retired" these
days & the vast majority of surviving ones use newer FPGA daughtercards
with the MSC01-style system controller anyway), but I believe writes
just get dropped & reads return zero. At least that's the way I recall
most accesses to unused address ranges working on Malta.

(Which is really annoying sometimes, and the newer Boston system gives
you a bus error in the equivalent scenario.)

Thanks,
    Paul
