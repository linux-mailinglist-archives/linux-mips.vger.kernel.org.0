Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 29B4B70B32
	for <lists+linux-mips@lfdr.de>; Mon, 22 Jul 2019 23:22:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732578AbfGVVWF (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 22 Jul 2019 17:22:05 -0400
Received: from mail-eopbgr730127.outbound.protection.outlook.com ([40.107.73.127]:38141
        "EHLO NAM05-DM3-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1732364AbfGVVWF (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Mon, 22 Jul 2019 17:22:05 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jebrAC8EfRmBvi/I7MN9tLgBydbqy74tLbPHMyIld+9eNw6eMVFAKX168W9HI6C7FxxzBKIir5rrJEaRrqlI99tVkhPXO0kWxbnRwKlZ7WIOvtFR7e6juohNHjF913CebjtgYzhEgZgn87EFzMBdwsEbXy5n2CtPl8/RHyzMGxo/kt280RgatU4g4Q3vCkytdxD4bgEAnH7hwqP9vkMy4ITwd1NxZXHUrHA3b/8/yiCoqAn9Ge9roZd5QpPV3mw6rv+TqxZVMZWEQBDCMnF3itSrLIYqPiED9Esh07bPSPJE2qFBZJrdd7k12OZMFe4NwwfW14D2n/OavG0k9WF22w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=u5HJuk71yP7SOfH0aZ8Yt+MNXq4L9CGmEg48nPyT+t4=;
 b=k/DURI8Q8w1C/AZWOYGUOeyqhplGeRf2oYEDIFZGEdzm6U6qq9oD1DwQEdu3klSa6CK9PORlkPQplcELuM1oxl0FCLVuNkTmwfQoBD5N95s32yHhhV6S5To25a1YCesDmoucoImXdFQ9dWeqgbMfhsnC2Dw3noE1fkwR0O0inrXV+TC22NXlffZfmJ2NNINxMqgqKqDNgLuMsj8d6Rpy8ZTSrzbsTuTMHpER3Jp5WEWKt0FYAmHc3TVbyO5LRizh2/ygbUudlZvT+Klwmff1KrHZRhWzV+XCGEmc/cH0G/cm6JdT55+RddfdvRSEwHu2MixnVj4wPgBEKye9amjkuw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=wavecomp.com;dmarc=pass action=none
 header.from=mips.com;dkim=pass header.d=mips.com;arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wavecomp.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=u5HJuk71yP7SOfH0aZ8Yt+MNXq4L9CGmEg48nPyT+t4=;
 b=QLIEOGAFyHm614yu9sUmQ04+929wCeYgb8wtwiN3GA/Vi26v8Srk2dKqfdAw28RB4Ow8z48EIz1Bw5ObjwKM9wpLUQWY6nD9eS3YttOdviuxEzyQWZf9uQOwexbiPPQeirvSq16wnVp7oEMu/1LPy66dmLmCB990C/nXBB6dPeM=
Received: from MWHPR2201MB1277.namprd22.prod.outlook.com (10.172.60.12) by
 MWHPR2201MB1757.namprd22.prod.outlook.com (10.164.133.167) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2094.11; Mon, 22 Jul 2019 21:22:02 +0000
Received: from MWHPR2201MB1277.namprd22.prod.outlook.com
 ([fe80::49d3:37f8:217:c83]) by MWHPR2201MB1277.namprd22.prod.outlook.com
 ([fe80::49d3:37f8:217:c83%6]) with mapi id 15.20.2094.017; Mon, 22 Jul 2019
 21:22:02 +0000
From:   Paul Burton <paul.burton@mips.com>
To:     Paul Cercueil <paul@crapouillou.net>
CC:     Ralf Baechle <ralf@linux-mips.org>,
        Paul Burton <pburton@wavecomp.com>,
        James Hogan <jhogan@kernel.org>, "od@zcrc.me" <od@zcrc.me>,
        "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Paul Cercueil <paul@crapouillou.net>,
        "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>
Subject: Re: [PATCH 2/2] MIPS: Decode config3 register on Ingenic SoCs
Thread-Topic: [PATCH 2/2] MIPS: Decode config3 register on Ingenic SoCs
Thread-Index: AQHVBSZs8Z1DpPAJxUm0uh8WxoawaKbXnK8A
Date:   Mon, 22 Jul 2019 21:21:59 +0000
Message-ID: <MWHPR2201MB1277AB1002C80447B77778DCC1C40@MWHPR2201MB1277.namprd22.prod.outlook.com>
References: <20190507224357.23778-2-paul@crapouillou.net>
In-Reply-To: <20190507224357.23778-2-paul@crapouillou.net>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: BYAPR04CA0013.namprd04.prod.outlook.com
 (2603:10b6:a03:40::26) To MWHPR2201MB1277.namprd22.prod.outlook.com
 (2603:10b6:301:18::12)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=pburton@wavecomp.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [12.94.197.246]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: f33cb4ff-2b90-42f3-7769-08d70eeaa1bd
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);SRVR:MWHPR2201MB1757;
x-ms-traffictypediagnostic: MWHPR2201MB1757:
x-microsoft-antispam-prvs: <MWHPR2201MB1757329DFCAD62B1D5A6D0CEC1C40@MWHPR2201MB1757.namprd22.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4941;
x-forefront-prvs: 01068D0A20
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(6029001)(396003)(376002)(39850400004)(346002)(136003)(366004)(199004)(189003)(66446008)(66476007)(3846002)(6116002)(4744005)(66556008)(66066001)(6436002)(64756008)(66946007)(52536014)(25786009)(14454004)(476003)(8676002)(6916009)(9686003)(305945005)(74316002)(7736002)(99286004)(71190400001)(52116002)(256004)(71200400001)(6666004)(4326008)(6246003)(26005)(81156014)(68736007)(186003)(8936002)(81166006)(2906002)(478600001)(486006)(11346002)(446003)(5660300002)(55016002)(53936002)(316002)(54906003)(42882007)(33656002)(386003)(7696005)(6506007)(102836004)(76176011)(229853002)(44832011);DIR:OUT;SFP:1102;SCL:1;SRVR:MWHPR2201MB1757;H:MWHPR2201MB1277.namprd22.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: wavecomp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: tMYoMbmQda+9hspSZQ6lq17+Uu8SaWuSSn5Fo06po0OmgN2fxcLvs/FqyVlCC+9304imaR0bWCBPvxzqPXXYBxpozesXUkpga6u5EnfbImxHuydvELQAVG0l3j4T4YZDcShZkZkbRxpKuVV6xaZcuFTSiR2NPPohyeC11KYyRETntSAHaLzFJZxjdn3jIl6/9aJcF5CqhbVF18ifADXsQFkGKCSNJsKCQIuSeZUE4duYu/KzRhtLIbjAhHX3oy0V/RNvhbIAUk+kUzV1Q+ule4q32LH37vIMi4msqg7Liptmvrh+Z7DFqzcvJNMB9wtnIOY36htaKf3LZc9b1TH7XfR8NVEerb5X8mJmCtuqSCvnc+2nugj5Nc2+LveVM5KKDa5ZlDpL5rY9kVebqlqe6AkcjXvsxM4osVx+ZctLJxQ=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: mips.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f33cb4ff-2b90-42f3-7769-08d70eeaa1bd
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Jul 2019 21:21:59.7251
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 463607d3-1db3-40a0-8a29-970c56230104
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: pburton@wavecomp.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR2201MB1757
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hello,

Paul Cercueil wrote:
> XBurst misses a config2 register, so config3 decode was skipped in
> decode_configs().
>=20
> Signed-off-by: Paul Cercueil <paul@crapouillou.net>

Applied to mips-next.

Thanks,
    Paul

[ This message was auto-generated; if you believe anything is incorrect
  then please email paul.burton@mips.com to report it. ]
