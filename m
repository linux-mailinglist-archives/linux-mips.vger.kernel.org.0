Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 01DCC6BF62
	for <lists+linux-mips@lfdr.de>; Wed, 17 Jul 2019 17:58:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727161AbfGQP6P (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 17 Jul 2019 11:58:15 -0400
Received: from mail-eopbgr810114.outbound.protection.outlook.com ([40.107.81.114]:48256
        "EHLO NAM01-BY2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726085AbfGQP6O (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Wed, 17 Jul 2019 11:58:14 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PmeBpg4p4WvNsa9wejoNJZ1cGQa6X3flrs6l4lyJswmppgz2RJUt17nBHTpUSOY20Cx1RyAv3tnMb/X7fa/4ERGuhyYP1Gl4SQEr9WNBxcGVY72pUOkajzL6+mn/vAe7sjexhaloOpD8AnVEHAIqlnsVKybnnG32Yvrg4Ykigl2pDMTGENFkNGfMcDo4/4j7SIt2ln4XFrIfrW2czJ88FSOFtsGXy1HXCDFwQ/tfJqgQ6LdujGVqO4mWK6irE2lCqxYvKQu/oCJcsp6ni7ucz6+08PI0Grlkzos2ADX+P5gTk9gdL51VozM6g22y6V3fSZet0B7U/qaUC91lLBGn6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ntu3DnAJnYRssmnEGXKxszb4pX0ppqiCrtWTPkPNakA=;
 b=jT9gGKPpiUS0iJkMGOnjgNi5UYVUlKSIHe9CRLYZUnv7qyG9lOIu4D8s0Jm97X/Km0I3nm6zIzhSm4QV586fg7nVDYUeii7cpraCWfuoKbs6ez58uSSrweb12jzDtfBYe9dSSYeV0CLalznyhzkFW0xwnpz6NPK60oZWzIte9pFMOF0p0cHuIufAstSt7JcsNu1mTvz8F0UF3NdY6JXdNq3rynCzX04VVaC9qIX1wn9h6AGuF+xUYjiAhLo7/uVhpxOQtF6+FajRHnfmF1qgMD9cSO3nU+ao68wvlyeOZ1cdOxt8zl1FpmboDZWCwgk04bc723gjoqtodxBv2t34pA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=wavecomp.com;dmarc=pass action=none
 header.from=mips.com;dkim=pass header.d=mips.com;arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=wavesemi.onmicrosoft.com; s=selector1-wavesemi-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ntu3DnAJnYRssmnEGXKxszb4pX0ppqiCrtWTPkPNakA=;
 b=l71DlfSIyNyjPXpo/vO+1E6Qdj4nLOZE/udFI+jOt7pArAVWfOjpHaUq4Y0PTnn0x1TJs3DDe4dPduc/7gWdA8ekzPWPI3Gafg4m7RrwCfeNRRcdEx/lglOXu2w8ARRUBtagAhHmlXZT66EppZAz7w/c9DOEC+otjZrFzsWSxOU=
Received: from MWHPR2201MB1277.namprd22.prod.outlook.com (10.172.60.12) by
 MWHPR2201MB1182.namprd22.prod.outlook.com (10.174.169.158) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2073.13; Wed, 17 Jul 2019 15:58:10 +0000
Received: from MWHPR2201MB1277.namprd22.prod.outlook.com
 ([fe80::746d:883d:31:522e]) by MWHPR2201MB1277.namprd22.prod.outlook.com
 ([fe80::746d:883d:31:522e%5]) with mapi id 15.20.2073.012; Wed, 17 Jul 2019
 15:58:10 +0000
From:   Paul Burton <paul.burton@mips.com>
To:     Vladimir Kondratiev <vladimir.kondratiev@linux.intel.com>
CC:     Ralf Baechle <ralf@linux-mips.org>,
        Paul Burton <pburton@wavecomp.com>,
        James Hogan <jhogan@kernel.org>,
        "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Vladimir Kondratiev <vladimir.kondratiev@linux.intel.com>,
        "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>
Subject: Re: [PATCH] mips: fix cacheinfo
Thread-Topic: [PATCH] mips: fix cacheinfo
Thread-Index: AQHVO6lDkTC8sdb3XkmqC6T/u/Yn+6bO+YiA
Date:   Wed, 17 Jul 2019 15:58:10 +0000
Message-ID: <MWHPR2201MB1277B5AFF0A7D2CAB84D39B6C1C90@MWHPR2201MB1277.namprd22.prod.outlook.com>
References: <20190716073656.24924-1-vladimir.kondratiev@linux.intel.com>
In-Reply-To: <20190716073656.24924-1-vladimir.kondratiev@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: BYAPR07CA0048.namprd07.prod.outlook.com
 (2603:10b6:a03:60::25) To MWHPR2201MB1277.namprd22.prod.outlook.com
 (2603:10b6:301:18::12)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=pburton@wavecomp.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [12.94.197.246]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: e87c0d94-3f1e-4864-9c4e-08d70acf910c
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);SRVR:MWHPR2201MB1182;
x-ms-traffictypediagnostic: MWHPR2201MB1182:
x-microsoft-antispam-prvs: <MWHPR2201MB118292B3DC5F8305B34B8452C1C90@MWHPR2201MB1182.namprd22.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4714;
x-forefront-prvs: 01018CB5B3
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(346002)(39840400004)(396003)(366004)(376002)(136003)(189003)(199004)(54906003)(4744005)(5660300002)(52536014)(186003)(99286004)(14454004)(3846002)(8936002)(2906002)(386003)(102836004)(26005)(4326008)(71200400001)(11346002)(66066001)(42882007)(71190400001)(6506007)(229853002)(66476007)(66446008)(66556008)(64756008)(66946007)(316002)(478600001)(446003)(74316002)(7736002)(476003)(6436002)(305945005)(68736007)(53936002)(14444005)(33656002)(81156014)(81166006)(8676002)(7696005)(52116002)(76176011)(6246003)(6916009)(25786009)(486006)(44832011)(6116002)(9686003)(256004)(55016002);DIR:OUT;SFP:1102;SCL:1;SRVR:MWHPR2201MB1182;H:MWHPR2201MB1277.namprd22.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: wavecomp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: htsRWTueWK+PckpJDzLzlriqEMTx9B2+8i+fPE/GAYQlf6xY+LVpq/fBhHU2+lggTSTKQZjZWOfXQeQIXhULRIDL/d50pukMAHXzSvn30lPXIuSR6fzHcdIUBVpavis3ouZSh6qbnSvSvjovv4HdLixBfo44bSq0iV7bsX0JaeL/Aokk1JYbHTcALTnh8zNKf63R89XyNsH23AYYsF1Dek3ARcRiOCUq+0D38AR0JboDJ8DThUglWSoekfAIF8WL6wp5omazx1Hlx0oe9Vk1EurRY1CuZ4RyMhozHVfE4VYvsLFXlAPUHYPKnTVuZc3wk5meMo7tIimuxMGAkknzLAbxTSOAtGgAdrtIZRfkGHRFzanoJv0j0HqajFZOiqnRgFJH1NLEHJ1/dArxRS3aAw7z16oHi2R0uq3E90iDmFc=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: mips.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e87c0d94-3f1e-4864-9c4e-08d70acf910c
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Jul 2019 15:58:10.5696
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 463607d3-1db3-40a0-8a29-970c56230104
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: pburton@wavecomp.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR2201MB1182
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hello,

Vladimir Kondratiev wrote:
> Because CONFIG_OF defined for MIPS, cacheinfo attempts to fill informatio=
n
> from DT, ignoring data filled by architecture routine. This leads to erro=
r
> reported
>=20
> cacheinfo: Unable to detect cache hierarchy for CPU 0
>=20
> Way to fix this provided in
> commit fac51482577d ("drivers: base: cacheinfo: fix x86 with
> CONFIG_OF enabled")
>=20
> Utilize same mechanism to report that cacheinfo set by architecture
> specific function
>=20
> Signed-off-by: Vladimir Kondratiev <vladimir.kondratiev@linux.intel.com>

Applied to mips-fixes.

Thanks,
    Paul

[ This message was auto-generated; if you believe anything is incorrect
  then please email paul.burton@mips.com to report it. ]
