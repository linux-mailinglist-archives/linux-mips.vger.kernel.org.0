Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 46C68D005D
	for <lists+linux-mips@lfdr.de>; Tue,  8 Oct 2019 20:00:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729670AbfJHSAb (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 8 Oct 2019 14:00:31 -0400
Received: from mail-eopbgr700092.outbound.protection.outlook.com ([40.107.70.92]:28576
        "EHLO NAM04-SN1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1728920AbfJHSAb (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Tue, 8 Oct 2019 14:00:31 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=K1APfPmbgFxgQMqlbJTfNZa/jUEW/AECP2GLr8ZtJ8fQwmCERMr1JPkYrGPpv6n07lvFSOGBhZ228GsquuNz6vIDFFtUoDYnVE2PiOlE0M/31KVmXz6mcSDxjcwO4xebD7ATUwpVBxsWR3f0WXA+JjgdfSZgtTUuA2QapzO4q0fkMtEsGpRaaQH3YjwIiOkDyzDqUXVEV5HDaGwy/aWdg9kbqnbCnYdCqH/saYssVOxqj47g2DWZJYykTcd0PUwsagZtmPkfp5mzpvI3KIQPnJbW3FHE3/tLOOSR2NUrEQ80mMCyRX3HgFZa3ww4lD7iIkIK85AjhXyRNrlMVIUZfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KggIE0QJw8POn5mDWzO3XOFmoX7Lkoaf1q+vx5oQSI4=;
 b=GDayHM0+PJLmZYaPjC3LXGO/pbcEoiSUCqeemwvDksRBOTp7PR2hevSUkf8sUl2WBbPWkMMPF688EKiU7lqWPRlFKCBM1nEsKZAfT2UKNh6gbz8/B4x1AABk4HhhG76HlecOZ6WLDR9CQgGitjNDoEIxz/U3N28rRaDWNVRrRI+9rLmUi0h1Hq9Y/IA0Fpxgbvt7cAZEUkcIX4LwDw8nwf7W7boYpcEn7jaTD9TXuDsYidywugzaAGC/pGyKgfXBFRX/vQkjRafOQiJAo5XfxmwStd9SsABly3U9ccbRUwJ8uB2+uRQ2QL0LQRwTEfpLanYH8BwsMuZ5j0nnIsed2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wavecomp.com; dmarc=pass action=none header.from=mips.com;
 dkim=pass header.d=mips.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wavecomp.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KggIE0QJw8POn5mDWzO3XOFmoX7Lkoaf1q+vx5oQSI4=;
 b=YaAjn/QJATmlXoIEwlGKH9rqr2h2bW5U6FJEeCVgff9kBACGIoiQdigI4TUwwo6hg1mqkdmde7sGbGnfHbvNBQRfCI1HGP89X09KGkDTQsUNJnCiYupn86guStQaibSZPVLVoUbyrCD2qCvK/pXrY0HIQ2G6DWP92JQUD0YlG5g=
Received: from MWHPR2201MB1277.namprd22.prod.outlook.com (10.172.60.12) by
 MWHPR2201MB1501.namprd22.prod.outlook.com (10.174.170.150) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2327.24; Tue, 8 Oct 2019 18:00:27 +0000
Received: from MWHPR2201MB1277.namprd22.prod.outlook.com
 ([fe80::c1dc:dba3:230c:e7f0]) by MWHPR2201MB1277.namprd22.prod.outlook.com
 ([fe80::c1dc:dba3:230c:e7f0%8]) with mapi id 15.20.2347.016; Tue, 8 Oct 2019
 18:00:27 +0000
From:   Paul Burton <paul.burton@mips.com>
To:     Huacai Chen <chenhc@lemote.com>
CC:     Paul Burton <pburton@wavecomp.com>,
        Ralf Baechle <ralf@linux-mips.org>,
        James Hogan <jhogan@kernel.org>,
        "linux-mips@linux-mips.org" <linux-mips@linux-mips.org>,
        "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
        Fuxin Zhang <zhangfx@lemote.com>,
        Zhangjin Wu <wuzhangjin@gmail.com>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>
Subject: Re: [PATCH V2 1/3] MIPS: Loongson: Add CFUCFG&CSR support
Thread-Topic: [PATCH V2 1/3] MIPS: Loongson: Add CFUCFG&CSR support
Thread-Index: AQHVfgJD7aQzoy7uTkWqi+86d0tu7Q==
Date:   Tue, 8 Oct 2019 18:00:26 +0000
Message-ID: <20191008180025.dtp2ingi6xgc5udu@pburton-laptop>
References: <1569073828-13019-1-git-send-email-chenhc@lemote.com>
 <MWHPR2201MB1277326D98BD1BFE0A5263BDC19B0@MWHPR2201MB1277.namprd22.prod.outlook.com>
 <CAAhV-H5Lt8N5PQLXO7-VQbOkrWD3eRZC2sOKPcBb3LmK9GN-BQ@mail.gmail.com>
In-Reply-To: <CAAhV-H5Lt8N5PQLXO7-VQbOkrWD3eRZC2sOKPcBb3LmK9GN-BQ@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: BY5PR13CA0004.namprd13.prod.outlook.com
 (2603:10b6:a03:180::17) To MWHPR2201MB1277.namprd22.prod.outlook.com
 (2603:10b6:301:18::12)
user-agent: NeoMutt/20180716
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=pburton@wavecomp.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [12.94.197.246]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 864c5fce-aae8-4121-898d-08d74c1965e0
x-ms-traffictypediagnostic: MWHPR2201MB1501:
x-ms-exchange-purlcount: 3
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MWHPR2201MB150104EEF979A8F8CC2D0332C19A0@MWHPR2201MB1501.namprd22.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6790;
x-forefront-prvs: 01842C458A
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(7916004)(136003)(396003)(376002)(346002)(366004)(39850400004)(199004)(189003)(14454004)(66556008)(42882007)(3846002)(52116002)(7736002)(53546011)(6506007)(386003)(476003)(11346002)(446003)(26005)(305945005)(66066001)(99286004)(76176011)(256004)(316002)(478600001)(58126008)(6116002)(1076003)(186003)(2906002)(64756008)(66446008)(66476007)(66946007)(8936002)(6246003)(229853002)(8676002)(81166006)(81156014)(33716001)(6512007)(9686003)(4326008)(966005)(71200400001)(71190400001)(486006)(54906003)(102836004)(44832011)(25786009)(5660300002)(6486002)(6436002)(6916009)(6306002);DIR:OUT;SFP:1102;SCL:1;SRVR:MWHPR2201MB1501;H:MWHPR2201MB1277.namprd22.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: wavecomp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 9ZEBBha/pvX9SNn537+8T4s0gxrV7b9qCHYpX7Ff0t5VJ3dKMqBfoRbHg0GNdJMuyaQkQ2TPhYDwMSKmjdbM58DH6qWuSXPMJ6gC/ygGONG3Kq3k4mMoECCA/HGJqlVXjJWfQGvu/zK+Kvxp7qtlUZtMAcq2EgylcmSRWVu/TnOOWqeGpVhfZTw/zcnWqOQwDAK/VVE0jQQQkNSdzEoDYt4amNluB1ovU3xkQ6ZxLupj7cbLwA/BWHLMcInvkjefg8tOpmwr/kL66kkavWLD06IRiP+0AHsPV/74WdnqsmcYzkk7k6rOCxM2p+mtFa//SexCoUW+KVP9AhPF296tm8KXDEAb4p7cl4SVmxVA3ubJqR5w4rmRsfPlH4jxjRZL3CBYz/N/b1sAtd4v+Ematmjqudmi6uuFTa3dL/pQ/8RqN5zMXl63fRdLEXmxpNOXDPW5HwCOZdHwNcGvFAW71A==
Content-Type: text/plain; charset="us-ascii"
Content-ID: <420B6BAC92C2CA41986205A86E7880A5@namprd22.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: mips.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 864c5fce-aae8-4121-898d-08d74c1965e0
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Oct 2019 18:00:26.8629
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 463607d3-1db3-40a0-8a29-970c56230104
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: IgZD/ry/jogEJBXqs02eSO4s7v14CUMzpknz1McC6a0+RS4zvJ7o1gEN8drf7iZ/PrwBDgYCGUXZhAN/zjEZbA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR2201MB1501
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi Huacai,

[Quote munged to fix top posting]

On Tue, Oct 08, 2019 at 03:09:27PM +0800, Huacai Chen wrote:
> Hi, Paul,
>=20
> On Tue, Oct 8, 2019 at 1:51 AM Paul Burton <paul.burton@mips.com> wrote:
> >
> > Hello,
> >
> > Huacai Chen wrote:
> > > Loongson-3A R4+ (Loongson-3A4000 and newer) has CPUCFG (CPU config) a=
nd
> > > CSR (Control and Status Register) extensions. This patch add read/wri=
te
> > > functionalities for them.
> >
> > Series applied to mips-next.
> >
> > > MIPS: Loongson: Add CFUCFG&CSR support
> > >   commit 6a6f9b7dafd5
> > >   https://git.kernel.org/mips/c/6a6f9b7dafd5
> > >
> > >   Signed-off-by: Huacai Chen <chenhc@lemote.com>
> > >   Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
> > >   Signed-off-by: Paul Burton <paul.burton@mips.com>
> > >
> > > MIPS: Loongson: Add Loongson-3A R4 basic support
> > >   commit 7507445b1993
> > >   https://git.kernel.org/mips/c/7507445b1993
> > >
> > >   Signed-off-by: Huacai Chen <chenhc@lemote.com>
> > >   Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
> > >   Signed-off-by: Paul Burton <paul.burton@mips.com>
> > >
> > > MIPS: Loongson-3: Add CSR IPI support
> > >   commit ffe59ee36aaa
> > >   https://git.kernel.org/mips/c/ffe59ee36aaa
> > >
> > >   Signed-off-by: Huacai Chen <chenhc@lemote.com>
> > >   Signed-off-by: Paul Burton <paul.burton@mips.com>
> >
> > Thanks,
> >     Paul
> >
> > [ This message was auto-generated; if you believe anything is incorrect
> >   then please email paul.burton@mips.com to report it. ]
>=20
> I found that there is a typo in the title, please change CFUCFG to
> CPUCFG, thanks.
>
> Huacai

It's too late for that - the email you replied to was telling you that
the patches have already been applied to mips-next, and I'm not going to
rewrite the mips-next branch for something so minor.

Thanks,
    Paul
