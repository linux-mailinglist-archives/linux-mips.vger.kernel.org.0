Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BC1D4D1B4C
	for <lists+linux-mips@lfdr.de>; Wed,  9 Oct 2019 23:58:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731140AbfJIV6R (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 9 Oct 2019 17:58:17 -0400
Received: from mail-eopbgr800118.outbound.protection.outlook.com ([40.107.80.118]:31605
        "EHLO NAM03-DM3-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1730675AbfJIV6R (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Wed, 9 Oct 2019 17:58:17 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WBI2CUPgMKWuVnCHOic0rhGxrp6hgOLyMpq1cPgPh381ERqDdLo9UBh/vmUWwPbyJzzdeSV6y1o4KoiemigQ8JOeVsq2Q4MMpWp8U7whEHbBxhuPR7zkkbEEqhomxaEEQ9qcIYZ2TvvfviGZudMSd9vvUCXKmtiVCLEKXUq3WFjQpGhzPqU5hzjeQJdLdkwWbsTGMSBqGEo4Lc7PVnRvur7Dw1qTS2dSclf44OODmhE/p/q1HR871DQ+k1vcaWlDSWlNoaVlPesdg9Jk89srdVI9isPkBcjGVP26lBTPwvWj0tT6gP0/XCM40u061moXQIGJH7B/JWkf6zqAy+NbzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WG2IGwDQgnghOL0MYclHfsCgu+tIrXnjcGER9JKY36U=;
 b=AoFJ0HYjTofOdpX11qWm7CKiY/ONLtKjitQO4B4X8gAeEUf1Na6qvynbRDnhRGcrP5YgdzhCqiPTi6zFazekBfgX2pCL3yXgt4YUZ8nZ7WEPssZPJcfHWGJP9eZh4Xnz8J00nwFp2UeqNhaEkJpGKjMc//F2Qhh4QhwxE7Osfvp4yvMYRJ9mc/IMaoe+StpmPPmHpp6vyJXOsNq2e4CI29O8os2JT00UzFDmagPl8wRFN/MKbu6HzfWNLeAkwcue7eYRkPPDqZwEZmlbJwiSssDxpk+QuhzH2r1V9+3HOMEKeJV0jiBBjymVvaG8Zl0NUYWZnufLu608WN/mWPZQcw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wavecomp.com; dmarc=pass action=none header.from=mips.com;
 dkim=pass header.d=mips.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wavecomp.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WG2IGwDQgnghOL0MYclHfsCgu+tIrXnjcGER9JKY36U=;
 b=lEyRlyZDMBWSIb0SVNVsasA6Tb/L6g06SOCiMNIiEoIA3lm42wGplIPFPMEr4qV0tBF0P/4tFdYbWgTT2PZPEsPk1hDwLq7+036H1BZ+hC72Yn9nS7JMRUmrtZM1pcA/phxPmctjByVol161AOmhG+XL/9Kh4AeNewAaHkfszyE=
Received: from MWHPR2201MB1277.namprd22.prod.outlook.com (10.172.60.12) by
 MWHPR2201MB1248.namprd22.prod.outlook.com (10.172.60.143) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2347.16; Wed, 9 Oct 2019 21:58:15 +0000
Received: from MWHPR2201MB1277.namprd22.prod.outlook.com
 ([fe80::c1dc:dba3:230c:e7f0]) by MWHPR2201MB1277.namprd22.prod.outlook.com
 ([fe80::c1dc:dba3:230c:e7f0%8]) with mapi id 15.20.2347.016; Wed, 9 Oct 2019
 21:58:14 +0000
From:   Paul Burton <paul.burton@mips.com>
To:     Thomas Bogendoerfer <tbogendoerfer@suse.de>
CC:     Ralf Baechle <ralf@linux-mips.org>,
        Paul Burton <pburton@wavecomp.com>,
        James Hogan <jhogan@kernel.org>,
        "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>
Subject: Re: [PATCH] MIPS: include: Mark __xchg as __always_inline
Thread-Topic: [PATCH] MIPS: include: Mark __xchg as __always_inline
Thread-Index: AQHVfuymnxpANFPhRkKj29bkfuLCNg==
Date:   Wed, 9 Oct 2019 21:58:14 +0000
Message-ID: <MWHPR2201MB1277E9F6ACABD358002C2B52C1950@MWHPR2201MB1277.namprd22.prod.outlook.com>
References: <20191009100600.10572-1-tbogendoerfer@suse.de>
In-Reply-To: <20191009100600.10572-1-tbogendoerfer@suse.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: BYAPR05CA0050.namprd05.prod.outlook.com
 (2603:10b6:a03:74::27) To MWHPR2201MB1277.namprd22.prod.outlook.com
 (2603:10b6:301:18::12)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=pburton@wavecomp.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [12.94.197.246]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 710c0c5a-e7f0-4add-d1f0-08d74d03c8bb
x-ms-traffictypediagnostic: MWHPR2201MB1248:
x-ms-exchange-purlcount: 1
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MWHPR2201MB12481C0E74EDB7FCD74CD9A6C1950@MWHPR2201MB1248.namprd22.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-forefront-prvs: 018577E36E
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(39850400004)(346002)(396003)(366004)(136003)(376002)(199004)(189003)(102836004)(33656002)(11346002)(386003)(2906002)(26005)(6506007)(446003)(99286004)(71200400001)(966005)(42882007)(186003)(71190400001)(478600001)(5660300002)(44832011)(54906003)(316002)(476003)(486006)(9686003)(6306002)(305945005)(52536014)(7736002)(66066001)(6436002)(4744005)(74316002)(8936002)(55016002)(81166006)(64756008)(81156014)(25786009)(6246003)(76176011)(7696005)(52116002)(256004)(6116002)(8676002)(66946007)(66556008)(229853002)(66476007)(6916009)(14454004)(66446008)(3846002)(4326008);DIR:OUT;SFP:1102;SCL:1;SRVR:MWHPR2201MB1248;H:MWHPR2201MB1277.namprd22.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: wavecomp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Un3FZMsxymQeNj3GkveDt+JrhUUsAu8lFjvg6VU0cJma3pdAj2iVaBHJwghRdqwqN7SuZTpe/np3ipehJAMIV4c1fAjYnZ5oJrw2vYT4TJTHXkS0owexQl/JnuocyuaWWXWpHTd/ns6pvknVNrmrQpxZc5h5lC5K7Ive5ZMKQCLHk6xPaPDYvUv6NlDcXBD3DMeQjVUaNsYzaAglnG3B+QrIbYNaFngHiqLqfg3RxoLvq6tkXXttFvvC9G77FgpJqOeNx/Jv9x3ARcldDY1qMUdxqMh0hZAsOS7Zzfq369Q5s6m/i3nQkTOv3IyP6vmdBa/iK5MUtzRHhfTk/X5Ckx5iqt0DsSzFJ+tRX0GVVm5OnL50SVMsjmJEv6tDWd7GamUtkzfx7bDtaoCLirXwCM/8qv3UGEZ37dSbv/IVx3Dc/d1TQh0IlFmDIFfA7kE773bfJmPn0RgB9mHhO/0PJA==
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: mips.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 710c0c5a-e7f0-4add-d1f0-08d74d03c8bb
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Oct 2019 21:58:14.8445
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 463607d3-1db3-40a0-8a29-970c56230104
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ONU/EhJBOpn6OcQ5XIYoaCli9ieyaDgqxtHMR2HZEvAcJCx+QWA+40DHOREsT0ZMmvpbhPRksrGZMMu9aHEHQw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR2201MB1248
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hello,

Thomas Bogendoerfer wrote:
> Commit ac7c3e4ff401 ("compiler: enable CONFIG_OPTIMIZE_INLINING
> forcibly") allows compiler to uninline functions marked as 'inline'.
> In cace of __xchg this would cause to reference function
> __xchg_called_with_bad_pointer, which is an error case
> for catching bugs and will not happen for correct code, if
> __xchg is inlined.

Applied to mips-fixes.

> commit 46f1619500d0
> https://git.kernel.org/mips/c/46f1619500d0
>=20
> Signed-off-by: Thomas Bogendoerfer <tbogendoerfer@suse.de>
> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> Signed-off-by: Paul Burton <paul.burton@mips.com>

Thanks,
    Paul

[ This message was auto-generated; if you believe anything is incorrect
  then please email paul.burton@mips.com to report it. ]
