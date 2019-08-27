Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5E0C89E54C
	for <lists+linux-mips@lfdr.de>; Tue, 27 Aug 2019 12:04:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727815AbfH0KEb (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 27 Aug 2019 06:04:31 -0400
Received: from mail-eopbgr690124.outbound.protection.outlook.com ([40.107.69.124]:23515
        "EHLO NAM04-CO1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725805AbfH0KEa (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Tue, 27 Aug 2019 06:04:30 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SeA1GCq723vx2j1lxThwkniul86eBTvwNTy/iUQWnMMzydzEBCgfS4AoMqFKXetkYeRNL758n8pix+cyl66bltYaax5stdrsoJyyZQfSNmXMgYZhPECND2VpOHlfyAMpIGl+88izG+apAPnilDoOyRSmYiJ90PY+A/8y8d8gZG2cb4e5jMNbE6QvTM2BPCuW1YjEQhc3lPsbUIk1JJOH2eeQb2DzD4BtbVWHBvFwy/FlVZFsEzX24B9El6SCIZpZph0i3+NCGjgADm4YhLz0763LFedYv3VSEyzOzlm9cLbNx4Ct61E/4DxeEvUndbRgfUM/5eExieQN4QDnSFhKMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WyYcJt30vIEhUKL86UG4/KYM+tcxU8JXS/dlbYT25QY=;
 b=UcJE+MmWdXvi3M+/F9uJ+idcg7AW6kn5JEYJlSEE7ca+f+QnWzGjHQ/S8oBhZwDAPdV+s2ugCFqhqEiwXb2mc3/Ddph+5/evCEMQFEA3neIQKtSpB98kXsPRHY3lACuX8XcoXd21R1lWX8yTOIbODLKrcb7WR0nEJR1vMW+RL6o63pn2Iv+WzOlfb1lVx5vM9biisjYMR6qSmM7cb19nH0NyMmF0UBiP/nSzq7uEjuTjZGH5S1jNE0bfIY+CV1k5vEne3fQH3mHosb9dVCTidgNTe19HNchJaVG2WClNNKw/ornoEHYOw//VRh8koYUnGzUF+hFApbhoTsN1pZepUg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wavecomp.com; dmarc=pass action=none header.from=mips.com;
 dkim=pass header.d=mips.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wavecomp.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WyYcJt30vIEhUKL86UG4/KYM+tcxU8JXS/dlbYT25QY=;
 b=uoErz5sCGk86MQLTf5eLBX1INGlNrYl3u0bBMB4I7AwvnUXvQUt1MNqKNahz4EOlzIKrrGrLzuGDukBBEJCDKs3GZzve+WqoeDnyo+EgCosCnWLiRs5hb6TBThEaMt1U0kC4QhjCRv1ZfrDYOauFvuuXxITd2CRVCvbDuX6m1O0=
Received: from MWHPR2201MB1277.namprd22.prod.outlook.com (10.172.60.12) by
 MWHPR2201MB1536.namprd22.prod.outlook.com (10.174.170.161) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2199.19; Tue, 27 Aug 2019 10:04:23 +0000
Received: from MWHPR2201MB1277.namprd22.prod.outlook.com
 ([fe80::f9e8:5e8c:7194:fad3]) by MWHPR2201MB1277.namprd22.prod.outlook.com
 ([fe80::f9e8:5e8c:7194:fad3%11]) with mapi id 15.20.2199.021; Tue, 27 Aug
 2019 10:04:23 +0000
From:   Paul Burton <paul.burton@mips.com>
To:     YueHaibing <yuehaibing@huawei.com>
CC:     Ralf Baechle <ralf@linux-mips.org>,
        Paul Burton <pburton@wavecomp.com>,
        James Hogan <jhogan@kernel.org>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Mike Rapoport <rppt@linux.ibm.com>,
        Michal Hocko <mhocko@suse.com>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        YueHaibing <yuehaibing@huawei.com>,
        "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
        "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>,
        "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>
Subject: Re: [PATCH -next] MIPS: Octeon: remove duplicated include from
  dma-octeon.c
Thread-Topic: [PATCH -next] MIPS: Octeon: remove duplicated include from
  dma-octeon.c
Thread-Index: AQHVXL7MPNdVTCGbT02z68VZO84++g==
Date:   Tue, 27 Aug 2019 10:04:21 +0000
Message-ID: <MWHPR2201MB1277BA013BC2E677E1924887C1A00@MWHPR2201MB1277.namprd22.prod.outlook.com>
References: <20190827072334.96670-1-yuehaibing@huawei.com>
In-Reply-To: <20190827072334.96670-1-yuehaibing@huawei.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: LNXP265CA0072.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:5d::36) To MWHPR2201MB1277.namprd22.prod.outlook.com
 (2603:10b6:301:18::12)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=pburton@wavecomp.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [94.118.89.251]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: f0918c6f-c4fb-47e5-cec8-08d72ad5ee75
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(2017052603328)(7193020);SRVR:MWHPR2201MB1536;
x-ms-traffictypediagnostic: MWHPR2201MB1536:
x-ms-exchange-purlcount: 1
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MWHPR2201MB153618E9D9B5B8F009034BF6C1A00@MWHPR2201MB1536.namprd22.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1850;
x-forefront-prvs: 0142F22657
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(366004)(136003)(376002)(39850400004)(396003)(346002)(189003)(199004)(6436002)(76176011)(6916009)(81156014)(99286004)(7736002)(64756008)(5660300002)(81166006)(54906003)(66556008)(52536014)(66446008)(478600001)(66476007)(71190400001)(71200400001)(486006)(52116002)(476003)(66946007)(4744005)(8676002)(33656002)(256004)(316002)(44832011)(6116002)(3846002)(74316002)(966005)(25786009)(7696005)(53936002)(4326008)(386003)(42882007)(186003)(2906002)(6306002)(14454004)(66066001)(229853002)(6246003)(9686003)(11346002)(446003)(6506007)(8936002)(305945005)(7416002)(55016002)(102836004)(26005);DIR:OUT;SFP:1102;SCL:1;SRVR:MWHPR2201MB1536;H:MWHPR2201MB1277.namprd22.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: wavecomp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 2df5tpuNsccrQVaED4qInwkbVI1DessqYNnKpIHDhDA6TnhAcLj/V6XQMlOZBAVSYm9wojYLI06zh+PlszdSPOXUXQBVmQvcyC4FUumhBHnX5nMQoTRCWKCu7mj+LBO+FTjT299rQcWj4tGnH3V8T3C+Ts+XT1jSwPwfaJuk8tJVbqnBSS90dXKGJs9LCmizbjCE4Te50W9ufN5Rs6SGPkJSacBC+xMb4Py0A+NUNnz/Tjn06fsG/iIoWhtjF99VxF8oHVDEofa3f/iN7LzAIJULbFO2bRUWGGq8QLyzQstxZYtmCmzAnYW2cIeCWu7mjFNJ1dufdXXrk008E3u43TxrI3jTE3rI0p5XT49o3lS6w1UKUBM97FQ5EN2ZFhpZM3zG28ixGCn89hB1/c8F6wqkOFSN8rkABza7MoOA7o0=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: mips.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f0918c6f-c4fb-47e5-cec8-08d72ad5ee75
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Aug 2019 10:04:22.3728
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 463607d3-1db3-40a0-8a29-970c56230104
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JvASwCGnnYok2WaaNst4oj2DuSQX0dVZOW88f/Fv8snPaBIFBUhhdhv3NtqKhiWS5JgRPo0jvxV0Z1xmLNxlaw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR2201MB1536
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hello,

YueHaibing wrote:
> Remove duplicated include.

Applied to mips-next.

> commit 00f3e689518b
> https://git.kernel.org/mips/c/00f3e689518b
>=20
> Signed-off-by: YueHaibing <yuehaibing@huawei.com>
> Signed-off-by: Paul Burton <paul.burton@mips.com>

Thanks,
    Paul

[ This message was auto-generated; if you believe anything is incorrect
  then please email paul.burton@mips.com to report it. ]
