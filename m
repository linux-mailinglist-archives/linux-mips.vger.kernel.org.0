Return-Path: <linux-mips+bounces-11584-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E224BAC645
	for <lists+linux-mips@lfdr.de>; Tue, 30 Sep 2025 12:02:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3CAFA3202D1
	for <lists+linux-mips@lfdr.de>; Tue, 30 Sep 2025 10:02:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D863E221D9E;
	Tue, 30 Sep 2025 10:02:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=hotmail.com header.i=@hotmail.com header.b="ZzZ2tfBV"
X-Original-To: linux-mips@vger.kernel.org
Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazolkn19013081.outbound.protection.outlook.com [52.103.35.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1048A1E8329;
	Tue, 30 Sep 2025 10:02:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.35.81
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759226529; cv=fail; b=kuq+nO/FC09zDXl0blLTchSoWddu2b87luY8On/15KzhMX/1lAhUf7k1dQ5HyoFBO1HP9f5euJxrXZlawPEHJPsxr6mwij2JCDK6YCpEULcpki7u4KDD8hxCo3/5VR4VqjARzrUW+otOn2AripNw4G/XrCUeI2+J/IJXgFeii6c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759226529; c=relaxed/simple;
	bh=x16oZwFHClpkRH/NMVHDfoct7PH+XSYBOfEvTTxyzOc=;
	h=From:To:Subject:Date:Message-ID:Content-Type:MIME-Version; b=TCutoMmkA8DKUVy95s5c/DKli4rpBs7a7iwUMQ4zTg2kRc0089bREYu/QtHStqJ37b6DGAfY1FMRG0no6tj7Mng66C8P8V8VAj2P4ZqEndjlzdAB7o+uE8/9pEQneVYok1vUNpzc18H+xmcBe4DX9DRquSD19MdD+71C+YV5rtI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=hotmail.com; spf=pass smtp.mailfrom=hotmail.com; dkim=pass (2048-bit key) header.d=hotmail.com header.i=@hotmail.com header.b=ZzZ2tfBV; arc=fail smtp.client-ip=52.103.35.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=hotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hotmail.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wM84IyT09GWkqLwnAzzGUCIDRS3qVKdA1wCkzaFtFo+0c08+v6iZUstHtCFxeHJbQ5pJzINYlZug/ppXzJuK3Aaj31wF/1+X75+4RdsgaU3kCf8tgn/iPVGHmcfA6vZGTLCP9Te7c9Yayugczcd6EAnfqszu8Ls173yZvvspjTJbrK0BlzroR14m/oq8oQau+h1n7It+3eFZXwjHKhVvR0A057qfg3SUYZwPHTkC5N6nUJKVcJZAt/PMt3Zei6yBM8Kp/ZscborJ7JlDoHo7ttR7XKy03xefJwx6NsQamWpA8EVteS240RRePgNmqCyWu8Oyw7Z+DtCU3fT4PGZ1SQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Bv4lVBTY2TMCAphz5lcgoiwwjge5SUkp3EEbq8gunVc=;
 b=nlCsJHQMPfN0XkCP8WxmdRMRwWktLFGZFAHqM7AVmOqO+0/8jzwqVHwE6F/oJU/Bz2AHsLfrr0ubOGNwWiYRk3XEkgUTwIAcw8Emw8hLzcsBbQcvx0iZyG1OYiWuJVy+ss+Csdq3TaVtptf4Foem2TqXVxx2RaYlkdedZxT1pZOGcu1dtz+igYQjArSYdOUId5L4nSMkN9bsP0j2VtPCwInc8sgK8RqjQaL8dxP4pefkHHgecUSSC+/krmKXfUPDHUfCi2J1iRwMCr+4GazxdGWkz+FSyBrvdV6kcaLDosWRCGDclTj/W73hZjpfCyFMOWsmAXjcII8pYeZhQDyzrA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hotmail.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Bv4lVBTY2TMCAphz5lcgoiwwjge5SUkp3EEbq8gunVc=;
 b=ZzZ2tfBVNVDo18YJ3paXvvYILOgio3mhA5bypix41oLc1K/J0YBflRAhWc3TVTtpODV6525xTunS3J1Wpic2fHS/dbD0o5jhQdzjf5A03/0evw9gJWRKDHfaqmsaTEEIWYALaUBD6JeQ/C0dECaWn+aJqJWoWUu0a1DAOIg+/0+5FtVBqvg8E+Y/pf/4DnuyoLMwylijuDzCrOgWGp+bxbpSpCHpH4PyPVLg9GZHvhur78yvGLeWGIoQVCXFp6tIzJct9RK+szlUesUqUQvoZglNN/Ff6VKMml774GaROaDySe5ljiH7to/skfxbDBiHi73rrNM1dHeT3lxjeNAu7g==
Received: from VI1PR02MB3952.eurprd02.prod.outlook.com (2603:10a6:803:85::14)
 by DB8PR02MB5804.eurprd02.prod.outlook.com (2603:10a6:10:11a::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.17; Tue, 30 Sep
 2025 10:02:03 +0000
Received: from VI1PR02MB3952.eurprd02.prod.outlook.com
 ([fe80::60e5:4de0:ff18:2fb1]) by VI1PR02MB3952.eurprd02.prod.outlook.com
 ([fe80::60e5:4de0:ff18:2fb1%3]) with mapi id 15.20.9160.013; Tue, 30 Sep 2025
 10:02:01 +0000
From: David Binderman <dcb314@hotmail.com>
To: "tsbogend@alpha.franken.de" <tsbogend@alpha.franken.de>,
	"linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>, LKML
	<linux-kernel@vger.kernel.org>
Subject: linux-6.17/arch/mips/kernel/kgdb.c: 2 * Array sanity check in wrong
 place ? 
Thread-Topic: linux-6.17/arch/mips/kernel/kgdb.c: 2 * Array sanity check in
 wrong place ? 
Thread-Index: AQHcMfDmUnvpzJAQKkmbgorHxmGi4A==
Date: Tue, 30 Sep 2025 10:02:01 +0000
Message-ID:
 <VI1PR02MB3952E838628A8350CF4196759C1AA@VI1PR02MB3952.eurprd02.prod.outlook.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: VI1PR02MB3952:EE_|DB8PR02MB5804:EE_
x-ms-office365-filtering-correlation-id: 3939ac2f-5203-4fcc-03c8-08de000866c8
x-microsoft-antispam:
 BCL:0;ARA:14566002|31061999003|19110799012|8060799015|8062599012|461199028|12121999013|15030799006|15080799012|40105399003|440099028|39105399003|51005399003|3412199025|102099032;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?AaFevZF6mi6AbnmvY1egGMKlbi1Uemqwf2wNyzx+zf33Nh/Lx8oqCHHQ4R?=
 =?iso-8859-1?Q?823e3xAc3l2NmDZNNx1xpqHGIB/c7zWeRpFeF00G9eIOsuP4uxbrOsPzY9?=
 =?iso-8859-1?Q?t4o5OZZpt9T7EvzdXKEhX+l7y5Yc93pAn1tcFFEWoICZ8v3QZ9etElEiwA?=
 =?iso-8859-1?Q?pCYKfjJzJemaIoGklKkDOuhiqAvDQzux5Zr9BZv5XkFF0aK7VK41xVqldg?=
 =?iso-8859-1?Q?EwIZkgdZB69+usdZaBoc0w1IFTYEtmkmxVaIw89Py/oze7Ztl2oVIj9C80?=
 =?iso-8859-1?Q?aZzxN54YXjPZBxAmBbdMadpwC0ifSI63r51lkufMxR98GL/FA3VjM7q8YX?=
 =?iso-8859-1?Q?eZEu5ME0z5U98iHRh8BRgyOtMKKsEGOAf5ilWy83quHwdRzjL+b1b0z9ki?=
 =?iso-8859-1?Q?uKt7YjP4uDWjLw+Ji1OztpHoslRdcbWLEwV414x2lPfhePXi9C+RgJoUlG?=
 =?iso-8859-1?Q?qPIDaNpmIe/G8YrQ6eFJ55vPJ8ZB7SJWZw5kR4l/6xTW0ySr0/F1GzxA+6?=
 =?iso-8859-1?Q?aNAl8ajfXug5E64vDdEI52r49LHk4E2eOCikqfmH1BDkSwJBqSPPwz5TJr?=
 =?iso-8859-1?Q?OxT46vx1THTbp/79zzbtLnxpTeaYEHDL94NpzWr6pdEE8zFLAeAEpkIAYp?=
 =?iso-8859-1?Q?v2IO7kgZ/1rL7E41y8e9Cx8mr4MCHnKk2IC+A6/vbmIICuWFMsla7dex1Q?=
 =?iso-8859-1?Q?aVj5VzSwvPfpDVy92FLCHZ1Eh2GlWjxvltS2IzWpIXQyd4Q5P25xnuMI+r?=
 =?iso-8859-1?Q?84Uxf/rKZvdeMpgLbQti4TDmUuNH4SDAMREZN8+1GKAsKVOVJjfztQaWqY?=
 =?iso-8859-1?Q?7xrufMYkODr9vbhqnhqzMjDjnCszhaNzlUJTWWgDELBFF/g4C6yniM4Ewi?=
 =?iso-8859-1?Q?WGhcC1SIvCFvnGsxkI5J3yX7SZHtoRMjtyUddDKjmVUANWV4GYUmR9yVdC?=
 =?iso-8859-1?Q?BW3JzHwE7CPYos9Lh6gFxyND/ryYrKmH33JSkS07Cqm2UpEmW5Gdseg4Zh?=
 =?iso-8859-1?Q?frnCAXomq6Ah9tGAhylVuT6WiI+7/kzxm9tz4BLUX32H7NUlXJfDUIhVZ9?=
 =?iso-8859-1?Q?67Q8L8ewvMRw/JpV/ws0xp3JaCSTAW2EDxTx0DovY55J3MqLWmb+bufyHF?=
 =?iso-8859-1?Q?AIYfSVklUp7iGsrFKR//a6eH3v4PAuw+xQnWJsp5D1uPkuj2bSYlO9gUbp?=
 =?iso-8859-1?Q?Az88FBJWoRfJ8ayrPg/6KD1ZdnlX/wYmehUMCoTV7JocPIDd+WUCpFcnEf?=
 =?iso-8859-1?Q?bBl//THrsV5Mbo6lPV83GtAfpNPOi81TdSRS95ufgfHg12K1+jbj1J/r1s?=
 =?iso-8859-1?Q?DjqAIOIB+gOmKHtwvjNoP+1bcA=3D=3D?=
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?KW5JtCl0uGYDmisv5e+8hu+A475Q1F0jUEaAQaxZFiUfydijB519PaOXuM?=
 =?iso-8859-1?Q?RyDmb9Ye+L3vSSqYEGgHlmzmhKCdPtNGqAdK/VHRyi5iwX/1ZSBb8jJGgS?=
 =?iso-8859-1?Q?mXzfiaLEm/Z7TP0aOw17uVBHA9kw0a06MAoseAQMcPF6FF5ynmG+YSp5Cp?=
 =?iso-8859-1?Q?K0Op9zsJiz1UF6k/F175wz7nQWvd6PEVsTU5x5Vr3FQ3qZQEsP2G5pS0ef?=
 =?iso-8859-1?Q?odyTFprC+gOPf90z80SM5W17FDqO/fAT2fSU9nFz0LDmNfPBWmYfMDsCtz?=
 =?iso-8859-1?Q?QO6hTqTakynE2ZXacYSglb4v6aS4l/VF6eH/7g1MxIdF0Koqozv5mnlGyg?=
 =?iso-8859-1?Q?fVWsqHyb7dMlVhGKWB7BPfnh1av5UqKDfU/iKOnCT5Nef4Gze01Ja3NKM0?=
 =?iso-8859-1?Q?t8hCzXJUQusU4QfYLcF2qzeZy/HccoXwdfYb3G/ph7k7JkxOh/zqKYz+RK?=
 =?iso-8859-1?Q?9edhJMcYoZo13UsCiJ4ABbheQL2/jDLrftQa+cwVTJBnaUwO0kcVoTZb7g?=
 =?iso-8859-1?Q?Xmy30joWGrIX7/Sg/HJ/zqGq5W7UBNVCsBsfKgDlqL6LDVZKKd/xDCiTVD?=
 =?iso-8859-1?Q?jbVlF4uhjZtAYENKy2Dsy5vooamrnimv4IysKltmSBcoeSdeoGxjhHMEH7?=
 =?iso-8859-1?Q?Z32vY0ZxRUO9dGPIM4l1O3EWXpzDPI9vm6PUDyGNy2LE91w5L9o1UfgSfC?=
 =?iso-8859-1?Q?DxxAzsKleHRfxDI9FB2KM6OL4d3wyDhq8MFB4nvTe1tbVPJuJWoOPeJHe0?=
 =?iso-8859-1?Q?HR3RZdeW+Upf2xHKYVWBfJ4fgZHWVXJdrIophwzhmmd8TtXvD81OcDB0TL?=
 =?iso-8859-1?Q?Uvt9xUdaJjF2ni27eJN35TGULQUp+DJbqoi6wBrf1stD5Cnbo6xqrBePdj?=
 =?iso-8859-1?Q?8Mi1R5/x6iagOrZDevqsreStyN57iKmU2CW8rDf2DING6rzAaZaVxHgsc0?=
 =?iso-8859-1?Q?pnEJAxTlL4gFXtlckJ9r6SIq33Xf82PwN0qooPCEkM/mQH8d/Jo9LgTmPj?=
 =?iso-8859-1?Q?yANxDEjPY+Ua4RhngZv+G8/q+p5cXvkzox/GXls23yv9YGwrDhNawFRqyY?=
 =?iso-8859-1?Q?r9pnT//zPdha+j7V6fhLKPpl0eTfavooEeDfW79eR3jYCdsP6OWy7ByY3q?=
 =?iso-8859-1?Q?G+9+xWyLp/vkUKP5EJZkfVLzAYC0PRp/ZQ0O7IFlcMiAGneCnx9mF5CDLh?=
 =?iso-8859-1?Q?wdJbAxNTm3wCUJBfiKcUNt5kTAzvaZviqgXx1mBUgLf5u21Sb/vQnhDSzm?=
 =?iso-8859-1?Q?+5PIUD0631VGzn5UdCjw=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: sct-15-20-8534-20-msonline-outlook-5faa0.templateTenant
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI1PR02MB3952.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: 3939ac2f-5203-4fcc-03c8-08de000866c8
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Sep 2025 10:02:01.7020
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR02MB5804

Hello there,=0A=
=0A=
Static analyser cppcheck said:=0A=
=0A=
1.=0A=
=0A=
linux-6.17/arch/mips/kernel/kgdb.c:137:17: style: Array index 'regno' is us=
ed before limits check. [arrayIndexThenCheck]=0A=
=0A=
Source code is=0A=
=0A=
    if (dbg_reg_def[regno].offset !=3D -1 && regno < 38) {=0A=
=0A=
Maybe better code:=0A=
=0A=
    if (regno < 38 && dbg_reg_def[regno].offset !=3D -1) {=0A=
=0A=
2.=0A=
=0A=
linux-6.17/arch/mips/kernel/kgdb.c:170:17: style: Array index 'regno' is us=
ed before limits check. [arrayIndexThenCheck]=0A=
=0A=
Duplicate.=0A=
=0A=
Regards=0A=
David Binderman=0A=

