Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D5D4C94FAE
	for <lists+linux-mips@lfdr.de>; Mon, 19 Aug 2019 23:17:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728352AbfHSVRL (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 19 Aug 2019 17:17:11 -0400
Received: from mail-eopbgr810091.outbound.protection.outlook.com ([40.107.81.91]:47952
        "EHLO NAM01-BY2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1728014AbfHSVRL (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Mon, 19 Aug 2019 17:17:11 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FrVy96Xd5uzGacqAfAqYoFJ0R2viywk1P7eF+ss7IfN2sjTrTjw/fzZkBDS0cf8C/KgBW6xgyrpoIXzUUkZXsbYqTvBAG8pDIyLaWFRalDlVM5u5Gh0Ash5F9/mucvn4Ghd9frIWy1fWGCQbwMhvVGmrjTpc5KN8zftIBjrlg6WdhlJaYiYhO79EeLqs75jvOGvetI/nijmyn7cL2E1MmmZBjGic7ijBjWpEV21hQgE4ech+11KS5t12vVz7yETRkRc5riehhirN7usFKFZzqlFXCgOKb9Ks0CXY2R3nQ8FpDCikOzwpJH+PXFtT8BwiUapHimgAN+1OzrhQyqGzsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Oy97RWXe9kN9wAu1mRdGSJoNTw+15+BoACmPkKcaEPE=;
 b=jeUJGkMFkRwzGR1QXVV/16ZKoc3b2hac4Y3pGBo9/2k6UjLH53ttTmOcBqrDg6IWwwTNT+DRVnD+9ypCkKuDTmCLIXSXJN5S8rc0T0EEBgVe6r09xf2Vmyfa6nbgEqqtwygeNfYnblQO5BR/AA2Fg8OtfvioPn+3DvQ4ErinGdMPnx3JvJfeE+T4votOgIZ7QAgwmXbTwwKVE313tSGi2ZUTDQc/Gf6hCt0AZ7r8jklVXHW7TrTOFZQRnjyWrHvy+b32vk5eb7fIH6kG4DHrWY7ANQX6pjHZo3PtNlO32vWf6l1qkjM9c7QDDTtCrzb3nN7bqkiCuGFbILNeHDMt1g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wavecomp.com; dmarc=pass action=none header.from=mips.com;
 dkim=pass header.d=mips.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wavecomp.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Oy97RWXe9kN9wAu1mRdGSJoNTw+15+BoACmPkKcaEPE=;
 b=uWpp939kMXvp9/jWiv0INS3zFAtEG9HJxFTtWABsew5FiSBC1aLdFqaaRubVna3/BDzfRRENrXWMorfAFqD50YcwGw9y1iMocpdofraRQt1lAGz2jJKZug+sxrpCoxh5wP5745qsgDaYg/stckv0ni/9YT0QECMTBM7yoWLwRb8=
Received: from MWHPR2201MB1277.namprd22.prod.outlook.com (10.172.60.12) by
 MWHPR2201MB1437.namprd22.prod.outlook.com (10.174.169.164) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2178.16; Mon, 19 Aug 2019 21:17:07 +0000
Received: from MWHPR2201MB1277.namprd22.prod.outlook.com
 ([fe80::f566:bf1f:dcd:862c]) by MWHPR2201MB1277.namprd22.prod.outlook.com
 ([fe80::f566:bf1f:dcd:862c%10]) with mapi id 15.20.2178.018; Mon, 19 Aug 2019
 21:17:07 +0000
From:   Paul Burton <paul.burton@mips.com>
To:     Christophe JAILLET <christophe.jaillet@wanadoo.fr>
CC:     "ralf@linux-mips.org" <ralf@linux-mips.org>,
        Paul Burton <pburton@wavecomp.com>,
        "jhogan@kernel.org" <jhogan@kernel.org>,
        "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>,
        Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
        "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>
Subject: Re: [PATCH] MIPS: Octeon: Fix a typo in #define OCTOEN_SERIAL_LEN
Thread-Topic: [PATCH] MIPS: Octeon: Fix a typo in #define OCTOEN_SERIAL_LEN
Thread-Index: AQHVVtN0Z+GdDtwo70yGMjhKXRr+Cg==
Date:   Mon, 19 Aug 2019 21:17:06 +0000
Message-ID: <MWHPR2201MB1277135EF8A78FC49EACA957C1A80@MWHPR2201MB1277.namprd22.prod.outlook.com>
References: <20190818155124.3750-1-christophe.jaillet@wanadoo.fr>
In-Reply-To: <20190818155124.3750-1-christophe.jaillet@wanadoo.fr>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: LO2P265CA0371.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a3::23) To MWHPR2201MB1277.namprd22.prod.outlook.com
 (2603:10b6:301:18::12)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=pburton@wavecomp.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [2a02:c7f:5e65:9900:8519:dc48:d16b:70fc]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 3025e8db-5ab8-4894-774c-08d724ea96bb
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);SRVR:MWHPR2201MB1437;
x-ms-traffictypediagnostic: MWHPR2201MB1437:
x-ms-exchange-purlcount: 1
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MWHPR2201MB14373A6E065DB1C89F75AAB3C1A80@MWHPR2201MB1437.namprd22.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3968;
x-forefront-prvs: 0134AD334F
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(396003)(39850400004)(136003)(376002)(346002)(366004)(189003)(199004)(316002)(6116002)(305945005)(7736002)(386003)(2906002)(229853002)(6506007)(81166006)(52536014)(66556008)(64756008)(66446008)(4744005)(81156014)(6306002)(74316002)(5660300002)(8676002)(55016002)(66476007)(66946007)(76176011)(52116002)(33656002)(99286004)(4326008)(9686003)(6246003)(6436002)(54906003)(256004)(478600001)(14444005)(8936002)(102836004)(186003)(42882007)(446003)(46003)(476003)(11346002)(44832011)(486006)(966005)(6916009)(7696005)(25786009)(53936002)(71200400001)(71190400001)(14454004);DIR:OUT;SFP:1102;SCL:1;SRVR:MWHPR2201MB1437;H:MWHPR2201MB1277.namprd22.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: wavecomp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: ojiVWU9VhKcjkpbBuziNxVtdzvh0n+rr3tj2nbk2UUORA791362e/bs41xG9E0v8D4Y3hG6+JyH5I1gV5yqlhxAX67UTFY9zR00ppplR+aO2LYN/TPdEgS8RbDXVSRVFsMgLH3Jk1m5HqBDqod7BMOwJGOZ+u1B/Aq1wCkilQPW5g7MHnF82zo1iGAfPzd3LpLgh5K1rsUkV+m5dSkhyKXXW5imzhRxSoiqD3pJxeoXZxVt+ZHwX6cBVuBR23FX3tIRXRwxISJ5J89HAFFa6fn63Stmsjn39gU+DuAGYqkqeKVTPoz7xdDjpDWvNoc71jeHJ0612shHsJMnTY5em0O0oMMKsm/MzxX9mCZKbue1vMVve0lfC2XqG6KmYEWW9K5WGRzbDYZbgaM5gFP6Lu8a9ek+I0lpX3/Np0waNYG4=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: mips.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3025e8db-5ab8-4894-774c-08d724ea96bb
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Aug 2019 21:17:06.8918
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 463607d3-1db3-40a0-8a29-970c56230104
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: GYQhW/r9Hsuxkc+PqXuJ8AXvwX2pM+Kd7PTEkJ5YKWAuHoqeS265O6LAUrEfhHS2jDhJL4mm8u02KsNs1MBSww==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR2201MB1437
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hello,

Christophe JAILLET wrote:
> It should be OCTEON_SERIAL_LEN.
> Update the #define and use it accordingly

Applied to mips-next.

> commit 3becd97e032a
> https://git.kernel.org/mips/c/3becd97e032a
>=20
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> Signed-off-by: Paul Burton <paul.burton@mips.com>

Thanks,
    Paul

[ This message was auto-generated; if you believe anything is incorrect
  then please email paul.burton@mips.com to report it. ]
