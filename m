Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5317B707E1
	for <lists+linux-mips@lfdr.de>; Mon, 22 Jul 2019 19:51:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730403AbfGVRvg (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 22 Jul 2019 13:51:36 -0400
Received: from mail-eopbgr740120.outbound.protection.outlook.com ([40.107.74.120]:61692
        "EHLO NAM01-BN3-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727021AbfGVRvf (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Mon, 22 Jul 2019 13:51:35 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=d/dUErM8F9Y+j5gAxHcmok7j4GlJrRNOJi7au3+qy1Whm6Ph7Jr442LNncywYcHLZ+1UC/LFb9gt83wL8CI2QvGs1cUDzNFn8JEZ3bYzws3mirmWj7m1wrItyoBNQh0bwtHTUrKmK4eHzipnLfVIlJS+o2V0pIbJxw5mnstu4cF6WiU66mTvOo50BGqN0Q4c8UUhx0HQucit5BGLq2lAqIC+FwQLeEF+SXpTwKjh985x98R5SqqI/cdpR1oaNSF4MXy/IWjYbDogYG0dFHgROqgAVcTyuhJndlLTJZ2K479WSb5oEvq3gnHE1lpHLSyt3L6UfPvdjnkTzRl5RIGaJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8RGmnIc/s24FZDH4Dr32rgG612JNj2RwyGx5+pWSqJU=;
 b=AfnnkhNmAAydpIiU71HYqkQhn19EAHrze9CGvuwmV7DPWIwaVuOZb7hsBdYfQcvVbU/M2ftCOqLfvLR4hJC/fAeidhRMoas5coZE1lKf+DOBkQIUFQdiHtx64dTwAHxwfPsn1RQddz5qaG7yaLmjeY2MMLadDUEPYdhvDQB5F0UGLke9QgCtbNzmblMFcdbOPg+IYrSg25usocL2Y3PaK0VhLI0Q4tMEH8ikAAbFV+safB6bZa8C15Ykzx3EYukWHRs0LMzJSFPswiNWRKFjk6m/t9RXHXC4WjdBEA7Y6ruOkjLy1RvjqeUJ9Oa9WvkTCUY/aysrj5FSdYyaPVE18g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=wavecomp.com;dmarc=pass action=none
 header.from=mips.com;dkim=pass header.d=mips.com;arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=wavesemi.onmicrosoft.com; s=selector2-wavesemi-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8RGmnIc/s24FZDH4Dr32rgG612JNj2RwyGx5+pWSqJU=;
 b=uGMIdS1SI3eQhIxpqNB/yzAEdD5iV5Uxdg0qSbAPrAauJfYj54RHUWxXC+iePYzgKQPGI/IHhmXCOvUmEuKbJyGNypHRy1yJDKL9U+Rbjim67ozsz6wS32nTGn/KmrnItdeDYOSfoQSsYNWd994HI1yJsmH5YByR4vlj+P44Zdk=
Received: from MWHPR2201MB1277.namprd22.prod.outlook.com (10.172.60.12) by
 MWHPR2201MB1101.namprd22.prod.outlook.com (10.174.169.151) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2094.16; Mon, 22 Jul 2019 17:51:32 +0000
Received: from MWHPR2201MB1277.namprd22.prod.outlook.com
 ([fe80::49d3:37f8:217:c83]) by MWHPR2201MB1277.namprd22.prod.outlook.com
 ([fe80::49d3:37f8:217:c83%6]) with mapi id 15.20.2094.017; Mon, 22 Jul 2019
 17:51:32 +0000
From:   Paul Burton <paul.burton@mips.com>
To:     Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
CC:     Jonathan Corbet <corbet@lwn.net>,
        Ralf Baechle <ralf@linux-mips.org>,
        James Hogan <jhogan@kernel.org>,
        "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
        "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>
Subject: Re: [PATCH 17/22] docs: mips: add to the documentation body as ReST
Thread-Topic: [PATCH 17/22] docs: mips: add to the documentation body as ReST
Thread-Index: AQHVQH27JrW5XRmOO0qbImVqVPcKF6bW6zSA
Date:   Mon, 22 Jul 2019 17:51:32 +0000
Message-ID: <20190722175131.op5tmsp3giuxlnwf@pburton-laptop>
References: <cover.1563792333.git.mchehab+samsung@kernel.org>
 <d1b00534f167baba66b1f808e1aed3f7c888c468.1563792334.git.mchehab+samsung@kernel.org>
In-Reply-To: <d1b00534f167baba66b1f808e1aed3f7c888c468.1563792334.git.mchehab+samsung@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: BYAPR07CA0072.namprd07.prod.outlook.com
 (2603:10b6:a03:60::49) To MWHPR2201MB1277.namprd22.prod.outlook.com
 (2603:10b6:301:18::12)
user-agent: NeoMutt/20180716
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=pburton@wavecomp.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [12.94.197.246]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: ada844be-70ec-4862-bd67-08d70ecd3b61
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);SRVR:MWHPR2201MB1101;
x-ms-traffictypediagnostic: MWHPR2201MB1101:
x-microsoft-antispam-prvs: <MWHPR2201MB110139BE6DDC0DA0AA04F287C1C40@MWHPR2201MB1101.namprd22.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1284;
x-forefront-prvs: 01068D0A20
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(7916004)(396003)(346002)(39840400004)(376002)(366004)(136003)(199004)(189003)(99286004)(66066001)(14454004)(6512007)(81156014)(9686003)(81166006)(6436002)(6506007)(53936002)(186003)(54906003)(58126008)(52116002)(386003)(102836004)(76176011)(4326008)(316002)(44832011)(6246003)(8936002)(26005)(486006)(8676002)(476003)(478600001)(68736007)(11346002)(6116002)(3846002)(2906002)(256004)(6486002)(42882007)(305945005)(33716001)(7736002)(446003)(1076003)(66946007)(66476007)(66556008)(66446008)(64756008)(25786009)(71200400001)(71190400001)(4744005)(229853002)(5660300002);DIR:OUT;SFP:1102;SCL:1;SRVR:MWHPR2201MB1101;H:MWHPR2201MB1277.namprd22.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: wavecomp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: S+JTGLUYg/ZxMU8r885Jd2sVml5rXdGq8FGQd/lfXCSvd8ofmWW/1wckrbzRaAHrVHgc1qTVj9LIHMWM3zzPYuZE4Sk06nc2NKO6IUI+2AuWNmm6fbJ7/vLtHK+pHDKn3oMWPBoUEdmkszvHjCCS0ko1boTSaE/0ivQrLMUOq1ZvppqXpTpiGXx2aw5I6xGQ3l7PTGlVsZb20yOidzPxguetBmv6EkjopYRg+JDPExYXt0iTaJVmN1fuf87p/jkfHcbfAazHug/dTJCVE57MAuJMSxzq6OyGUfCRPYYlhMRZ69D+XgyelWBniL9Dw9nEvBDOpJpV2Z1yBnZn0xg5ZVFnWmQcouahlt3R0L+jxWHkIkzI7gYhKHO0XtdqvLo81YnSG0PTuwfzNZaok/EzOc93mbVxmF70iAbOoQkYbzI=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <065F9B4CF0E82F418EC64F95D2954BF0@namprd22.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: mips.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ada844be-70ec-4862-bd67-08d70ecd3b61
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Jul 2019 17:51:32.6342
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 463607d3-1db3-40a0-8a29-970c56230104
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: pburton@wavecomp.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR2201MB1101
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi Mauro,

On Mon, Jul 22, 2019 at 08:07:44AM -0300, Mauro Carvalho Chehab wrote:
> Manually convert the AU1xxx_IDE.README file to ReST and add
> to a MIPS book as part of the main documentation body.
>=20
> Signed-off-by: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
> ---
>  Documentation/index.rst                       |  1 +
>  .../{AU1xxx_IDE.README =3D> au1xxx_ide.rst}     | 89 +++++++++++--------
>  Documentation/mips/index.rst                  | 17 ++++
>  3 files changed, 70 insertions(+), 37 deletions(-)
>  rename Documentation/mips/{AU1xxx_IDE.README =3D> au1xxx_ide.rst} (67%)
>  create mode 100644 Documentation/mips/index.rst

Acked-by: Paul Burton <paul.burton@mips.com>

Thanks,
    Paul
