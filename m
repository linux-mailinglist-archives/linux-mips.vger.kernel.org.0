Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id ABD75D1B4A
	for <lists+linux-mips@lfdr.de>; Wed,  9 Oct 2019 23:58:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730675AbfJIV6U (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 9 Oct 2019 17:58:20 -0400
Received: from mail-eopbgr800122.outbound.protection.outlook.com ([40.107.80.122]:38528
        "EHLO NAM03-DM3-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1729161AbfJIV6T (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Wed, 9 Oct 2019 17:58:19 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YUutRbFibUNzfOqO2S4u7nML4Hk4DgD2hrfgsoB/v3ECO+5+EfTvD/K2GwXhlV096SDpu4NGbNfWc+oqd2vjfN1ZFe/cmv9CwnMajkIw0CZ7aicIPT8CMkzYnjIWq6I+M1VuMG3GAoLGoY0SlTISEuK806h6SFYHf6jFg8xVRHQKDqgRL8i9fYIjDPqF+L1vnkHxorpZ0FMS+UbTcclFJKb3VRdi4fxuTP1JX1n5YzsoTtUxUsYBu/kPjn8E9nkdetvRYBvVRHZf31tUUumkqnwfqGgpu4uesd0OKAHBqXJ9reqZBJHPDueQ2BGSnpfy8xPugVq0r++8mcK+jL4TaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JoSgWB8Ped6Hks8GPsUpLdGBW8s2unQF7+kBGNSpwo8=;
 b=AujpRjTSLLSImhOWVY4z6tf+RmtMYvEi+v2+i64u0anDRlu660JxQ+0ZNeWehvegdZwLldDUFN3BfZAlnKjt+GMrRqXEKJcFaD8LFZK7vkBUA7rL+fpz3yyMEtsUqDKUPNxLn/Ixu638F5kAzlF8HrSAVzZcc/Hv0hD+r3rOdA98UX1h5Eq6h8ns8gz1dKGM4Kyz4twZm9LIIisOycnO0vhAQwcucuhz57Rxvz5YHyGp1xJoI1FkIeDpYpH1rFXNC/O7+ndZ34VR5OwCpxSXYA1uaHsr7rgHpNDWUywA9HJ2YopNa5aPEpxXRy6l2zQt8mVHpTz+8HWjEeHskytwUw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wavecomp.com; dmarc=pass action=none header.from=mips.com;
 dkim=pass header.d=mips.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wavecomp.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JoSgWB8Ped6Hks8GPsUpLdGBW8s2unQF7+kBGNSpwo8=;
 b=EuHEh91vkadpAAr4nd/BbhOf2CUSJaT18m5zGl8i7f9Lwx+CBJkI0X3GZ/5jiyVKv2w7wx76SbiEszcvwQ/mipOn18/B9zzJow+iqi2GpPh7OCJWw7TyGGuyYtL/yboM5a6MH7OiwZl34yapUstp9DiUHLX2huqSUnLzClX/YpM=
Received: from MWHPR2201MB1277.namprd22.prod.outlook.com (10.172.60.12) by
 MWHPR2201MB1248.namprd22.prod.outlook.com (10.172.60.143) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2347.16; Wed, 9 Oct 2019 21:58:17 +0000
Received: from MWHPR2201MB1277.namprd22.prod.outlook.com
 ([fe80::c1dc:dba3:230c:e7f0]) by MWHPR2201MB1277.namprd22.prod.outlook.com
 ([fe80::c1dc:dba3:230c:e7f0%8]) with mapi id 15.20.2347.016; Wed, 9 Oct 2019
 21:58:17 +0000
From:   Paul Burton <paul.burton@mips.com>
To:     Thomas Bogendoerfer <tbogendoerfer@suse.de>
CC:     Ralf Baechle <ralf@linux-mips.org>,
        Paul Burton <pburton@wavecomp.com>,
        James Hogan <jhogan@kernel.org>,
        "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>
Subject: Re: [PATCH] MIPS: fw: sni: Fix out of bounds init of o32 stack
Thread-Topic: [PATCH] MIPS: fw: sni: Fix out of bounds init of o32 stack
Thread-Index: AQHVfuyoxqvUaAvqVkGOeAt9NBXiLA==
Date:   Wed, 9 Oct 2019 21:58:17 +0000
Message-ID: <MWHPR2201MB1277BB42F0EE769C77A8477EC1950@MWHPR2201MB1277.namprd22.prod.outlook.com>
References: <20191009151056.32289-1-tbogendoerfer@suse.de>
In-Reply-To: <20191009151056.32289-1-tbogendoerfer@suse.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: BYAPR05CA0011.namprd05.prod.outlook.com
 (2603:10b6:a03:c0::24) To MWHPR2201MB1277.namprd22.prod.outlook.com
 (2603:10b6:301:18::12)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=pburton@wavecomp.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [12.94.197.246]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: b06dd60a-87ef-449e-b1fd-08d74d03ca8c
x-ms-traffictypediagnostic: MWHPR2201MB1248:
x-ms-exchange-purlcount: 1
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MWHPR2201MB1248D709D19466D65E250DE2C1950@MWHPR2201MB1248.namprd22.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4502;
x-forefront-prvs: 018577E36E
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(39850400004)(346002)(396003)(366004)(136003)(376002)(199004)(189003)(102836004)(33656002)(11346002)(386003)(2906002)(26005)(6506007)(446003)(99286004)(71200400001)(966005)(42882007)(186003)(71190400001)(478600001)(5660300002)(44832011)(54906003)(316002)(476003)(486006)(9686003)(6306002)(305945005)(52536014)(7736002)(66066001)(6436002)(4744005)(74316002)(8936002)(55016002)(81166006)(64756008)(81156014)(25786009)(6246003)(76176011)(7696005)(52116002)(256004)(6116002)(8676002)(66946007)(66556008)(229853002)(66476007)(6916009)(14454004)(66446008)(3846002)(4326008);DIR:OUT;SFP:1102;SCL:1;SRVR:MWHPR2201MB1248;H:MWHPR2201MB1277.namprd22.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: wavecomp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: nETWHvR+q8gKCIo4XWUPDwxornqb6kC+CcTIxJnXLEMIWdxVJIFdQrC+Rap7QEPox6DzKCWlS0R+zlvAQDSD6qQtdW1B6et0DxaZEkiQRkjlAfb3w5GONsx8Y/u1QRVtNVVjLHNadwlTnLpQz+y3dbegoIypT708zedfeGljkyWWdyK+LQkHiwaB05k7VFBzBsf2jfyjHNjHFScjuXFY+7pZu+xSGUOY3kAkX83WfTXPnoh2CJMgyZRfAa0jfCGWZpH6MlON6QEJ73vlesy+R+Dazeijbctw/84qNsnaqR5cIlINpVjePRQuc3nlM5rSHrtqA6G7hekZ8zFmnum9JFkWVBkERJHxWwqZXseEnJ3ZD219YiXMstj12LkUmT87iInC37xuxEHrBJT1yJ1k6iPwv+UhrIfMBCdiBPduZFSjR+i+eJFrXUhmTIp08L12YaUKuXEdOcwcci56H8MXWQ==
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: mips.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b06dd60a-87ef-449e-b1fd-08d74d03ca8c
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Oct 2019 21:58:17.8191
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 463607d3-1db3-40a0-8a29-970c56230104
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: RLCkWworbHtj/43tuTYBYwVxibQx81PphcobhIneUnVcLTiw+DN9ETR9lBXtT1dR7+LGLlLYJbDqD6smk+FMNg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR2201MB1248
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hello,

Thomas Bogendoerfer wrote:
> Use ARRAY_SIZE to caluculate the top of the o32 stack.

Applied to mips-fixes.

> commit efcb529694c3
> https://git.kernel.org/mips/c/efcb529694c3
>=20
> Signed-off-by: Thomas Bogendoerfer <tbogendoerfer@suse.de>
> Signed-off-by: Paul Burton <paul.burton@mips.com>

Thanks,
    Paul

[ This message was auto-generated; if you believe anything is incorrect
  then please email paul.burton@mips.com to report it. ]
