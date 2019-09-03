Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id ED0DBA64B0
	for <lists+linux-mips@lfdr.de>; Tue,  3 Sep 2019 11:07:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727005AbfICJH4 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 3 Sep 2019 05:07:56 -0400
Received: from mail-eopbgr790104.outbound.protection.outlook.com ([40.107.79.104]:28992
        "EHLO NAM03-CO1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726740AbfICJH4 (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Tue, 3 Sep 2019 05:07:56 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=g5jjyyjPVUkVgrbX6I1Cm2p7gnymOdTg/T5+Q8xMo+RAFbxAUJRea6aTcN8srMponY+y+sRjBe2MCPMJky/5DvHjIxtfTIfDIHWV83USv/sMRVTQEi1D76qsdpMy3b8SLOe8/5PrDtGboIOM/B1kuyLp8fRefAsvmx34FCRBuxf12IaGt+dNVxdLSwTr8pTLYQMw16A5b611NOy1GVLeXPCl7cZtGjalKfd66UsqgC/wZmm/FWi/zZHhkO0liFayijX+mavej9XKWOGlMuCMflNdcjmJY9rrv7Y/GkyQuTuoNPShgR6l+YbsiiJ5BLjaiRTV3QCTJFvx8mrgwxLo6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QqwS6lpQ1GdpPZRbqawQB9uruaGPGNMIgzEEOw2mVIo=;
 b=b+5B8ewE7RlG9aEZq8q640PbsTTk5I3thlR9SeNr2et4vAKx8vsCECOos/++lGo61yWoFcVopJrSgm0gWx1L/w5UT1YiPsU3KVctmk4BDZiI1Q1EyRgSKOCQHT+pfk5Vb6kEgYsltb87woQ1ME1FJbxalMLSEs4RF78j6IkxCtet7OcG2AJ4YijQVwe0fyt2HTsfSjeDwFetAldKr4/2MhhquCPxPjlV6lyjx8ayB4b74znVsVOdbovm+mxharQb5bcfoQjtjUJNG0J6Vwi0k8Bp10pPNFcMuIpcNdUywG2CDj6wgKbxPlfzlj+v93bmX8h+8ys20ZoGvDBeWl4bhQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wavecomp.com; dmarc=pass action=none header.from=mips.com;
 dkim=pass header.d=mips.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wavecomp.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QqwS6lpQ1GdpPZRbqawQB9uruaGPGNMIgzEEOw2mVIo=;
 b=Cym2eQyo41tBkDETBlUQLb38cJcPGoJCMrPOXdd7ypoHJMsz2yTvUZyEfuK8uNm8rBW85094LqrBvcHzWzanQMjywaT23iGHwTvVBY3ZmkIq1KpmYL5ZvhbwGpAa9qc5ld4tUxc4PqzKN1rUYfEJ26FlZwrtKTXNkHWn20L0ySI=
Received: from MWHPR2201MB1277.namprd22.prod.outlook.com (10.172.60.12) by
 MWHPR2201MB1311.namprd22.prod.outlook.com (10.172.62.20) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2220.18; Tue, 3 Sep 2019 09:07:51 +0000
Received: from MWHPR2201MB1277.namprd22.prod.outlook.com
 ([fe80::f9e8:5e8c:7194:fad3]) by MWHPR2201MB1277.namprd22.prod.outlook.com
 ([fe80::f9e8:5e8c:7194:fad3%11]) with mapi id 15.20.2220.021; Tue, 3 Sep 2019
 09:07:51 +0000
From:   Paul Burton <paul.burton@mips.com>
To:     Rob Herring <robh+dt@kernel.org>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>
CC:     "open list:MIPS" <linux-mips@vger.kernel.org>,
        Huacai Chen <chenhc@lemote.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Jason Cooper <jason@lakedaemon.net>,
        Marc Zyngier <maz@kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Mark Rutland <mark.rutland@arm.co>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
Subject: Re: [PATCH 11/13] dt-bindings: mips: Add loongson cpus & boards
Thread-Topic: [PATCH 11/13] dt-bindings: mips: Add loongson cpus & boards
Thread-Index: AQHVYjcQZOaz4gEz0kSE1jLx3WD3zQ==
Date:   Tue, 3 Sep 2019 09:07:51 +0000
Message-ID: <20190903085904.bwmm4knaodopvzvd@pburton-laptop>
References: <20190827085302.5197-1-jiaxun.yang@flygoat.com>
 <20190827085302.5197-12-jiaxun.yang@flygoat.com>
 <CAL_JsqL6htVye-LSBWw1WwRy9xH=zwuH6gurscwoCWj9Te_hAg@mail.gmail.com>
 <d94eff2b-76ec-5cd2-512d-5ee0406a1bb9@flygoat.com>
 <20190827204105.7nyt4pi7lvxse5ij@pburton-laptop>
 <CAL_Jsq+VmFi6r1-WOa9RJ4vfqsZLqcn5HMbv1oyQjhtJ8Qd8Lw@mail.gmail.com>
In-Reply-To: <CAL_Jsq+VmFi6r1-WOa9RJ4vfqsZLqcn5HMbv1oyQjhtJ8Qd8Lw@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: LNXP265CA0005.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:5e::17) To MWHPR2201MB1277.namprd22.prod.outlook.com
 (2603:10b6:301:18::12)
user-agent: NeoMutt/20180716
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=pburton@wavecomp.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [94.196.173.241]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: e335bbbb-1f6d-4010-5552-08d7304e32b4
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(7168020)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(2017052603328)(7193020);SRVR:MWHPR2201MB1311;
x-ms-traffictypediagnostic: MWHPR2201MB1311:
x-microsoft-antispam-prvs: <MWHPR2201MB1311C5AD7E0793CFF9050BBFC1B90@MWHPR2201MB1311.namprd22.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4125;
x-forefront-prvs: 01494FA7F7
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(7916004)(136003)(366004)(376002)(346002)(39840400004)(396003)(199004)(189003)(58126008)(110136005)(478600001)(53936002)(6436002)(99286004)(8676002)(8936002)(256004)(66066001)(6116002)(81156014)(316002)(9686003)(6512007)(54906003)(3846002)(81166006)(6486002)(7736002)(229853002)(33716001)(25786009)(305945005)(14444005)(7416002)(42882007)(102836004)(386003)(55236004)(6506007)(4326008)(14454004)(44832011)(486006)(476003)(186003)(52116002)(26005)(66946007)(66556008)(64756008)(6246003)(71190400001)(66446008)(71200400001)(5660300002)(66476007)(4744005)(2906002)(1076003)(76176011)(11346002)(446003);DIR:OUT;SFP:1102;SCL:1;SRVR:MWHPR2201MB1311;H:MWHPR2201MB1277.namprd22.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: wavecomp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: FMgbT5lCQyiUFFcnF3VEIF4iOkEOIqwVzqKERx20ZzrEhkzDy3C+O53Isa8444XZ6S9x3PSLB0cSxAubmoGS/3civOzjrQb8F3PCGBC6+/GnUNoavnDX9Ou8HgSOKAc8ZvnWFk8qFenhyXXuUPvTIVcZI5y6trtcCCY7N4bs/xDgq5G+i5HEIer77tF20+fBfxfBMDAUEm5RjTOGckrkJ9fJutxpIuflpFoWTTcJIDE5DDJuRowvc5oUsgju1qNsPuV1/Oor0CUoaj0U9ABTzxSgApPsHiYQaHGTSG4TqbMOcHR2+Nhuw9EVyu4MhpOU6rF8NctUlld6wxoEdOE3MMgsTLZQqsZ58igzz70eBn9gIHvcApjBPm3u/gS0+t6Dw6zwPDa4yzJbM3w0NAC7zgwZ0vVljrXK1LhpTQKO750=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-ID: <4A796A79D38DD0458284E8705F3EA529@namprd22.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: mips.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e335bbbb-1f6d-4010-5552-08d7304e32b4
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Sep 2019 09:07:51.4205
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 463607d3-1db3-40a0-8a29-970c56230104
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Q8YaicAwwaE35hEeAzQ5L3BwgCiPX4ilvOlsYK6lF+1MnngbCys7MG3wHyU/WBgXWyx9yrGahD0ClJTy68QaPA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR2201MB1311
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi Rob,

On Mon, Sep 02, 2019 at 03:50:47PM +0100, Rob Herring wrote:
> > In general on MIPS we detect CPU properties at runtime from coprocessor
> > 0 registers & similar sources of information, so there's not really a
> > need to specify anything about the CPU in devicetree.
>=20
> We thought the same thing initially for Arm... Mostly what is in DT is
> not what is discoverable. Are clock speeds, power domains, low power
> states, etc. all discoverable?

No, that's a good point - clocks etc may need to be specified in DT. I
just don't see any of that in this patchset - it appears all that is
specified is cache sizes which we already detect. So in this case I
don't see a need for including CPUs in DT at all.

Jiaxun - did you add all this information to DT to avoid the "cacheinfo:
Unable to detect cache hierarchy for CPU" messages during boot? If so
that should be fixed by commit b8bea8a5e5d9 ("mips: fix cacheinfo"). If
not, could you describe why the CPU nodes are needed here?

Thanks,
    Paul
