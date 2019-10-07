Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E1A41CEB13
	for <lists+linux-mips@lfdr.de>; Mon,  7 Oct 2019 19:54:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729283AbfJGRxu (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 7 Oct 2019 13:53:50 -0400
Received: from mail-eopbgr820104.outbound.protection.outlook.com ([40.107.82.104]:38437
        "EHLO NAM01-SN1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1728031AbfJGRxu (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Mon, 7 Oct 2019 13:53:50 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LrWezca+6qm3YUUstFybeEPGm2/dRA7q6Ys8k8joY33FhoVuQXGrSk6Ei4tFtJ6En8vw9Sap0pbl0XTmG87+Ws2cfcVF9ZicH1JOgPHi4stfA6ZzDUyegWSzkRZjUvNoMkG7dVVeN8FcWHwRIM959o5bBX/gllBx7mjgi16wZlUAmmMohQGSYi77+OFWPCXAApYihZLGit1R3EUk6ISwH1ZJv5lEhLruoDiyYVU8NBKLHgPT/aRhiN3b1FdzUP0whzVBaKh1pdi49jeND4qOHadDMQbBJU/VnFkj+Uc8435VqeE7W34pW2J8Hqmb1tp0voQoni3x1YnkAUsnIkaQmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/ywwRnLlBMhZsKWBDgAih86YZ3BiG3neAIZRDKMMAL4=;
 b=KGHBYiQNvka7MG1jFfsNao2Lf5/HzNibFLeubuSN+V8p74uPUGZHnyLggyUFD116SWZNvxIeOOmAswxRiDdYpQDOYVLsUL7P87ffS/9q8dwCtLMUnZIhbCDErggC5bnKlWs24zhVc/4rsdjPXopo1ELl8GdYukrUG8pivt6FNvfZ8ygIHyXbAjEbVeo59AnhOzKLmRtYz6M48QURpdwwqUhQHOnT14b813yMIqoXy8R1n6XA14+mxOqCSroWkVkQZnyL8cL61eN0geJ/bbF83pJnakMuRareUs+X8t56ufnDCB7tBTJ/Sth6+DWuvI7vNFTyFpIIfLSy/rEoonaDFw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wavecomp.com; dmarc=pass action=none header.from=mips.com;
 dkim=pass header.d=mips.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wavecomp.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/ywwRnLlBMhZsKWBDgAih86YZ3BiG3neAIZRDKMMAL4=;
 b=LsLA65KGT5VFkl4l7hp8y+I8/Aug6AzVhw34i0j62CaF7ZVVAnxxVtpob2sG9C4XFa8MUvS8Yfn/A9QULm1+BqdC5+Kxp0wCPLd9k8dG5HXdJhZ/fc/B/xQpj7yPk7MUJTMmhqx5GwT6hgIQYyvm76icD5mu/YgcclrCweDshOc=
Received: from MWHPR2201MB1277.namprd22.prod.outlook.com (10.172.60.12) by
 MWHPR2201MB1549.namprd22.prod.outlook.com (10.174.170.162) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2327.24; Mon, 7 Oct 2019 17:53:48 +0000
Received: from MWHPR2201MB1277.namprd22.prod.outlook.com
 ([fe80::3050:9a38:9d8e:8033]) by MWHPR2201MB1277.namprd22.prod.outlook.com
 ([fe80::3050:9a38:9d8e:8033%5]) with mapi id 15.20.2327.025; Mon, 7 Oct 2019
 17:53:48 +0000
From:   Paul Burton <paul.burton@mips.com>
To:     Alexandre GRIVEAUX <agriveaux@deutnet.info>
CC:     "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "mark.rutland@arm.com" <mark.rutland@arm.com>,
        "ralf@linux-mips.org" <ralf@linux-mips.org>,
        Paul Burton <pburton@wavecomp.com>,
        "jhogan@kernel.org" <jhogan@kernel.org>,
        "agriveaux@deutnet.info" <agriveaux@deutnet.info>,
        "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>
Subject: Re: [PATCH v2 2/5] MIPS: CI20: DTS: Add I2C nodes
Thread-Topic: [PATCH v2 2/5] MIPS: CI20: DTS: Add I2C nodes
Thread-Index: AQHVfTgrmDu5Xm/NYEmc/PvIiOhGTg==
Date:   Mon, 7 Oct 2019 17:53:48 +0000
Message-ID: <MWHPR2201MB1277B5668FD6B1C7BA380FF8C19B0@MWHPR2201MB1277.namprd22.prod.outlook.com>
References: <ceeb8d3316809672697f735b927cac77b449c70f.1569955865.git.agriveaux@deutnet.info>
In-Reply-To: <ceeb8d3316809672697f735b927cac77b449c70f.1569955865.git.agriveaux@deutnet.info>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: BYAPR08CA0058.namprd08.prod.outlook.com
 (2603:10b6:a03:117::35) To MWHPR2201MB1277.namprd22.prod.outlook.com
 (2603:10b6:301:18::12)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=pburton@wavecomp.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [12.94.197.246]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 481545c2-17eb-4cfa-9584-08d74b4f4e27
x-ms-traffictypediagnostic: MWHPR2201MB1549:
x-ms-exchange-purlcount: 1
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MWHPR2201MB1549134CD09FEE6C113D2E07C19B0@MWHPR2201MB1549.namprd22.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1850;
x-forefront-prvs: 01834E39B7
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(376002)(136003)(346002)(396003)(366004)(39840400004)(189003)(199004)(52116002)(99286004)(476003)(7736002)(305945005)(54906003)(76176011)(25786009)(486006)(33656002)(42882007)(478600001)(2906002)(11346002)(446003)(52536014)(5660300002)(6246003)(7696005)(4744005)(71200400001)(71190400001)(66066001)(316002)(14454004)(229853002)(102836004)(9686003)(81156014)(6436002)(81166006)(6116002)(55016002)(74316002)(3846002)(44832011)(4326008)(8676002)(186003)(6916009)(26005)(966005)(386003)(8936002)(6506007)(6306002)(66946007)(66556008)(64756008)(66446008)(66476007)(256004)(6606295002);DIR:OUT;SFP:1102;SCL:1;SRVR:MWHPR2201MB1549;H:MWHPR2201MB1277.namprd22.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: wavecomp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Rh5vxJ90Fm5ZpZ0d4DssTFlGXJEXCHAkYaIhApmI2N+4SYYXe6KmySQdBvL9748JE4SSCtDyDmU3S+0eAzxcXLtXSFOoZ+KHecVCCyvxfX6Fdro0ZAdiKxcqBA58ZfTyf8zqCiQYghPTaGLt54QBMdlzSSRTywNV6NCT8TcXORWv1uhMxhfxNRPxLNsPyB0HoZIWas5YZXLSOAGBa+L+gr7OdpGbrwBAhMyl3eawWXhsdZSds9Ng18xeJ8vRRO5miyQFDCJFWmy8qRxK9dvFN1ouoNjQ5XXt5rxnwhFKYAufSDukHDM1cNEQ1aG4R4F4vhO1DTqgstP1W0Aac0f8uZM6HwvRa00/YkZaxX5SbqZF0hbTVB+zOqRU46YVtYynRqzWP25AIKGbS/tqedTdm3FflODWyxnQ62nh5ezrAT7LysM8cPGvTzSAAyKhC3q7fkUxwO5mKjeclTfjotqhfg==
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: mips.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 481545c2-17eb-4cfa-9584-08d74b4f4e27
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Oct 2019 17:53:48.4170
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 463607d3-1db3-40a0-8a29-970c56230104
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: biInNuZh5do4+lhy2dviRrXemsPq+Y+zceg7DnteYxTfBikW6L8mpP/a9bbdggmlb0+q6Y0e9SQ9AtvjFVpyHw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR2201MB1549
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hello,

Alexandre GRIVEAUX wrote:
> Adding missing I2C nodes and some peripheral:
> - PMU
> - RTC

Applied to mips-next.

> commit 73f2b940474d
> https://git.kernel.org/mips/c/73f2b940474d
>=20
> Signed-off-by: Alexandre GRIVEAUX <agriveaux@deutnet.info>
> Signed-off-by: Paul Burton <paul.burton@mips.com>

Thanks,
    Paul

[ This message was auto-generated; if you believe anything is incorrect
  then please email paul.burton@mips.com to report it. ]
