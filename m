Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 238D5D1C3E
	for <lists+linux-mips@lfdr.de>; Thu, 10 Oct 2019 00:53:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732168AbfJIWxp (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 9 Oct 2019 18:53:45 -0400
Received: from mail-eopbgr740123.outbound.protection.outlook.com ([40.107.74.123]:53842
        "EHLO NAM01-BN3-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1730999AbfJIWxp (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Wed, 9 Oct 2019 18:53:45 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CxZ2eWTARrwV9uNW5UDvbIGgYbR2LiETzW08tUHIhTDdjEL7odpYTcr+vBbpDdBvaZ6CtIUljemzATlGcUPCOlTUMcdQ4+BZ8Z6pFHE1zyUthLGUshL3ERH9n8HQ+/6qWWMY+3cWZ6YahTNI4yYJtJqfdjROSotabaUNVM+GuyWPDcmFi1aallxR6UgkqPmLwIQ1B89JJAwOIHFvZs07qeo2WVDrU1AHSsFicCeZUkMgrZwxxwHyph8rYtZsvBRx2QJStdlytunvdCNP6xBzvsiqF4J1H6w4B9fykAfI8uVv6r+a+Ioivki4MaYTtrpb14aKTy/6cKc+aDmwWsnOTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gJhMuCE8LAwpE5XdhAt6Wea+y+4W5WxtjMQJGOFtKaM=;
 b=K4jrpRNFyVp5C71nAM+dM7q9NuqZ81/CoRwNXnEjYj8TUyiVf9ao+MIMRGHpxuDjId2RWp3WrQTL3SnVVnRzaIDu9o+mc22LxGba8NWoXViFbNy0JEIUyEnEI+bMN/5NhcRMSByGulo/gVDbxRMaoOwL7u/AHkgr9LNSCIIP/626Px5PA1AicD3/HNf/xbv2ltTdr1Xg7+FqrH8RfEo0Onmigo+yp9hlnj+vcOQzGIivMvJRIwvy9ZI/NtrndUf5e+qbIILGhcC0VvadWCTbl9B7SW1hkdRKVC2GEIIIth0myrEULeXvSzGylIdeOgY/HZU0q80HKKix1xWCIKp2Lg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wavecomp.com; dmarc=pass action=none header.from=mips.com;
 dkim=pass header.d=mips.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wavecomp.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gJhMuCE8LAwpE5XdhAt6Wea+y+4W5WxtjMQJGOFtKaM=;
 b=edvriSd4Ku/ES98nFAbYjDwCJenIvKuoySYF7IHd+hTK6cgypLoiGnf15XVbvEsP+95WCM+gZms9vYt+gy4ut973g1O2qbv6CGP1wGp9o8LR97DPUJL/llqypqg6Al5BFfm7IucJl2Aq/Hp25Nu7ZsxrzTpY2QlhbRhw0AMm5CE=
Received: from MWHPR2201MB1277.namprd22.prod.outlook.com (10.172.60.12) by
 MWHPR2201MB1021.namprd22.prod.outlook.com (10.174.166.34) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2347.17; Wed, 9 Oct 2019 22:53:42 +0000
Received: from MWHPR2201MB1277.namprd22.prod.outlook.com
 ([fe80::c1dc:dba3:230c:e7f0]) by MWHPR2201MB1277.namprd22.prod.outlook.com
 ([fe80::c1dc:dba3:230c:e7f0%8]) with mapi id 15.20.2347.016; Wed, 9 Oct 2019
 22:53:42 +0000
From:   Paul Burton <paul.burton@mips.com>
To:     Paul Burton <pburton@wavecomp.com>
CC:     "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
        Paul Burton <pburton@wavecomp.com>,
        "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>
Subject: Re: [PATCH 3/4] MIPS: cmdline: Remove redundant Kconfig defaults
Thread-Topic: [PATCH 3/4] MIPS: cmdline: Remove redundant Kconfig defaults
Thread-Index: AQHVfV1dKA/znw7xLEmQ9KKBLUDtWqdS7g4A
Date:   Wed, 9 Oct 2019 22:53:42 +0000
Message-ID: <MWHPR2201MB1277CE1F001736BEE4091B1BC1950@MWHPR2201MB1277.namprd22.prod.outlook.com>
References: <20191007221951.1889661-3-paul.burton@mips.com>
In-Reply-To: <20191007221951.1889661-3-paul.burton@mips.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: BYAPR01CA0034.prod.exchangelabs.com (2603:10b6:a02:80::47)
 To MWHPR2201MB1277.namprd22.prod.outlook.com (2603:10b6:301:18::12)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=pburton@wavecomp.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [12.94.197.246]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: c4cf1837-0a55-4265-d4f7-08d74d0b8809
x-ms-traffictypediagnostic: MWHPR2201MB1021:
x-ms-exchange-purlcount: 1
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MWHPR2201MB1021304E73F76E1342E2BC27C1950@MWHPR2201MB1021.namprd22.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-forefront-prvs: 018577E36E
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(346002)(366004)(39840400004)(136003)(376002)(396003)(189003)(199004)(66556008)(4744005)(66066001)(66446008)(52536014)(5660300002)(66476007)(66946007)(64756008)(81166006)(81156014)(8676002)(8936002)(71200400001)(42882007)(478600001)(71190400001)(6862004)(11346002)(446003)(4326008)(6506007)(76176011)(386003)(7696005)(52116002)(186003)(966005)(102836004)(14454004)(26005)(9686003)(6306002)(6436002)(2906002)(74316002)(25786009)(6246003)(44832011)(3846002)(476003)(486006)(6116002)(7736002)(55016002)(305945005)(33656002)(99286004)(229853002)(256004)(316002)(54906003);DIR:OUT;SFP:1102;SCL:1;SRVR:MWHPR2201MB1021;H:MWHPR2201MB1277.namprd22.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: wavecomp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: U+eEhmm7oKXC+ZhlJue8xx2yfzHpWTFduYbtpRFa9S8pC9007fVN9TbyYID8+jKFf74KMXHQDpT4tvdO8LkPUC24xhRhjkpvhMgtiM7rdndD7kFSbr81rn1g7m0za5mPCLAWdupxg7zwoosgo2oIxa+esZiVlLgEhaLAOZ+VCk7HQgey/W/ikijyykiIYNaRryVOQngYx3fTDzwfp8L+ruitnHs5fcG9A5AqNt5ECN96roWbIv7ZHKya9E5janNrFanue+YzQJ3u3RQCz/I+YyhStTb5lMaImSW70YqFrSWzkfKvXlasU4pO4FtWdtdUnE0YmAjOgWzXE2ktJEeS2yC2pkYw45BNQ6UxpN6UEDTNlcF4EwJY01WoSTDqUvjDVXAq+uYeLx39Jgso6Fosutzs4VfvI4gx3TzQqnrt6L43iJCvbVwTjmYSqp6qrYI6eF1dfVkon53y+jnT48oCeA==
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: mips.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c4cf1837-0a55-4265-d4f7-08d74d0b8809
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Oct 2019 22:53:42.1647
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 463607d3-1db3-40a0-8a29-970c56230104
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: +obZ2NAky7ZLK4kYR+nUH0MGkOByV+oOavTavfEQ9xtOhvJSl3NMWFVmeO5ASgEd1wfMMvVQk8CN8GcchbNSJQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR2201MB1021
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hello,

Paul Burton wrote:
> CMDLINE, CMDLINE_BOOL & CMDLINE_FORCE all explicitly specify default
> values that are the same as the default value for their respective types
> anyway (ie. n for booleans, and the empty string for strings).
>=20
> Remove the redundant defaults.

Applied to mips-next.

> commit c85ac57ce241
> https://git.kernel.org/mips/c/c85ac57ce241
>=20
> Signed-off-by: Paul Burton <paul.burton@mips.com>
> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>

Thanks,
    Paul

[ This message was auto-generated; if you believe anything is incorrect
  then please email paul.burton@mips.com to report it. ]
