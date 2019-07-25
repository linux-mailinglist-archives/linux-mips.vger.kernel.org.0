Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 69851754D4
	for <lists+linux-mips@lfdr.de>; Thu, 25 Jul 2019 18:59:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388177AbfGYQ7g (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 25 Jul 2019 12:59:36 -0400
Received: from mail-eopbgr740137.outbound.protection.outlook.com ([40.107.74.137]:24192
        "EHLO NAM01-BN3-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S2387616AbfGYQ7f (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Thu, 25 Jul 2019 12:59:35 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NCsgsxUP86S4a/hCYWH1e2rYx5QisDaASAAAcpqyGC2OtNAlBfxMQBecIe+PGYwvSAIMDIVbMn9iFAlQzhhYKoe6Ll9/PGqZi1n3rOmO+ibFyaMKInDxD/hmbP+T9wyEbKJKmjt6hEliyjkmOBaRWWfy8hSpi07yt6js599AvoV9Nekci/cjcrUmvMzLumF8pY5S1St7+XbQWNLizoVPbTr9LUJev04E9l6mggiZ85QBinv65hQ+x3xzRDeZ/S8lp/ZOcBAz6HU8A+V0b+AwpdF/0jxaZiUTDmZIc40t/m/lMEfJ774VJWSQ6VzWGO2TkG8PtHxJDquLifaZl0ckoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lUwBbgpWpuaNb7R9R/w4zsI0MS/6goTDvnNv0fwyV0Q=;
 b=jnCkf23NMof2o9bNXXIoR6/1N4uiQJ77HjO7RpYaCvMRgCfLe6AFRHa7FrX/+0RRCxjuCkUDf9WSVYPRN0bg7hH0qR6jKwNKK7SuX9tRDlVJ/R4txH0H/XVGYqX+pEC3pu1ZzY/HqJpWmbJLCLj2u1LHlFnvvABOYfBTnYpI43o373ouu+vqo2FwYiIPRY3m5Iz7BrLkCNKHPejAP8NgAGIoICNtZfOaBJ4e6MoCCI6arIphvhOO0d9HK19+puavOebNEqJfxTGcEGtLcDw+hWw9YEebyyfBiJf4389OzjkObp1OZ3zcr3vDjgKe9JH9/BlkEI6W5GIAhbdFPP8a8w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=wavecomp.com;dmarc=pass action=none
 header.from=mips.com;dkim=pass header.d=mips.com;arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wavecomp.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lUwBbgpWpuaNb7R9R/w4zsI0MS/6goTDvnNv0fwyV0Q=;
 b=YZuqyl7AP65uIGl15lvsvAxEEXbBij9H69wbII+gg4eiRo7i0zjuCHAJCJjjjh5vuX82aB/kqR2rSANNqM0N6SiTXTDb5mZX20eHV7OADHVf1BQQwPeVIpTfvH1RPNneOuaLezys0lYw2B9WPa+dA7HOuEhQWYvJE3blmtNU7s4=
Received: from MWHPR2201MB1277.namprd22.prod.outlook.com (10.172.60.12) by
 MWHPR2201MB1344.namprd22.prod.outlook.com (10.174.162.147) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2094.17; Thu, 25 Jul 2019 16:59:32 +0000
Received: from MWHPR2201MB1277.namprd22.prod.outlook.com
 ([fe80::49d3:37f8:217:c83]) by MWHPR2201MB1277.namprd22.prod.outlook.com
 ([fe80::49d3:37f8:217:c83%6]) with mapi id 15.20.2094.017; Thu, 25 Jul 2019
 16:59:31 +0000
From:   Paul Burton <paul.burton@mips.com>
To:     Paul Cercueil <paul@crapouillou.net>
CC:     Ralf Baechle <ralf@linux-mips.org>,
        James Hogan <jhogan@kernel.org>,
        "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "od@zcrc.me" <od@zcrc.me>
Subject: Re: [PATCH] MIPS: Add support for partial kernel mode on Xburst CPUs
Thread-Topic: [PATCH] MIPS: Add support for partial kernel mode on Xburst CPUs
Thread-Index: AQHVQwpUGZILpjjRRkOL6x5V3OyS8w==
Date:   Thu, 25 Jul 2019 16:59:31 +0000
Message-ID: <20190725165930.yvlvmavcgqocl3nn@pburton-laptop>
References: <20190724234654.16555-1-paul@crapouillou.net>
In-Reply-To: <20190724234654.16555-1-paul@crapouillou.net>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: BYAPR04CA0030.namprd04.prod.outlook.com
 (2603:10b6:a03:40::43) To MWHPR2201MB1277.namprd22.prod.outlook.com
 (2603:10b6:301:18::12)
user-agent: NeoMutt/20180716
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=pburton@wavecomp.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [12.94.197.246]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 4c061dd8-ff78-4fae-ec30-08d711217669
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);SRVR:MWHPR2201MB1344;
x-ms-traffictypediagnostic: MWHPR2201MB1344:
x-microsoft-antispam-prvs: <MWHPR2201MB134415E1345B5F5BA003A02EC1C10@MWHPR2201MB1344.namprd22.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 0109D382B0
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(979002)(7916004)(376002)(396003)(366004)(136003)(39850400004)(346002)(189003)(199004)(6486002)(446003)(14454004)(305945005)(99286004)(4326008)(68736007)(102836004)(42882007)(7736002)(6916009)(229853002)(71200400001)(26005)(44832011)(1076003)(71190400001)(9686003)(186003)(11346002)(25786009)(6512007)(81166006)(316002)(81156014)(8676002)(6116002)(8936002)(486006)(58126008)(476003)(76176011)(6436002)(52116002)(33716001)(6506007)(53936002)(386003)(54906003)(66066001)(66476007)(66556008)(14444005)(478600001)(66946007)(66446008)(256004)(64756008)(3846002)(6246003)(5660300002)(2906002)(969003)(989001)(999001)(1009001)(1019001);DIR:OUT;SFP:1102;SCL:1;SRVR:MWHPR2201MB1344;H:MWHPR2201MB1277.namprd22.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: wavecomp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: K6itYRoBS7Gkt0feI6XJt1zZEdoA/M7unBUqvllmU6MvdUs8z6BYdbWFZ7r5b7gv67zraDXOZuY2DTbNvrpsVOQM85UJakZaoV5cNjARdqlWmrMC2dBjm8o2e1/+46Nmo4PR77SxRki81eRBwIPe/8787Xe7doWXGWcEmuwDdFNx73lQyFEIaDL69OaWvcX2I+4+6H/q6Wp5InoBdA3Cz/YKFRUVow+vyNmDsOyiGwf1JCqNTjAC27QonCjHUjNFi/dIKj76rdlB4Oebz2knMaCZpghhyylRJwvrqd7Y1J6di0lQnXgPXlVrE1RgpEgzDpO50clAi7/KOt1NivFpzqz63Td7Lu7hcTHwfsHLtF8FhnEs3XVYI7JtEy+3YvBnnpyqonM3PGoEMQs7wfqJfDAI3lbH1/Xbk1/WdKk19W0=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <21D86F87B7DF294883B163CAA59E91AD@namprd22.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: mips.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4c061dd8-ff78-4fae-ec30-08d711217669
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Jul 2019 16:59:31.9054
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 463607d3-1db3-40a0-8a29-970c56230104
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: pburton@wavecomp.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR2201MB1344
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi Paul,

On Wed, Jul 24, 2019 at 07:46:54PM -0400, Paul Cercueil wrote:
> Support partial kernel mode of Xburst CPUs found in Ingenic SoCs.
> Partial kernel mode means the userspace applications have access to
> the TCSM0 banks of the VPU,

So far so (reasonably) good :)

> and can execute cache instructions.

Aaaah! Scary!

Does this allow *all* cache instructions? If so that's a big security &
stability hole - if userland can invalidate kernel data or data from
other programs then it can create all sorts of chaos.

Also do you know which Ingenic SoCs this is available on? I see it
documented in the JZ4780 Programming Manual, but Config7 bit 6 is shown
as reserved in my copy of the XBurst1 CPU Core Programming Manual.

I notice the JZ4780 documentation says it allows access "including TCSM,
CACHE instructions" which is scary too since it doesn't say that's *all*
it allows access to. Though just cache instructions by themselves are
enough to be game over for any notion of security as mentioned above.

What is it you want to do with this? I'm wondering if we could achieve
your goal is in a safer way.

Thanks,
    Paul
