Return-Path: <linux-mips+bounces-8363-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id AF1E6A71005
	for <lists+linux-mips@lfdr.de>; Wed, 26 Mar 2025 06:02:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A1C8F3B94AF
	for <lists+linux-mips@lfdr.de>; Wed, 26 Mar 2025 05:01:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E1E95170A0B;
	Wed, 26 Mar 2025 05:01:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="R3BmUlfO"
X-Original-To: linux-mips@vger.kernel.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11on2063.outbound.protection.outlook.com [40.107.220.63])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E35CF42A8F;
	Wed, 26 Mar 2025 05:01:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.220.63
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742965315; cv=fail; b=RT5nXDnPfa/eWFFs4zrG1ELWaSAxU1iAPip0iVhMxeQdRT5tFtXhactc82b/HPvGSBrAfniOcglCKa7QgmEtSdYjtVPYdiqVT7E2FG8e90TZ/1ls0TKtcPqYTvpzDC1m8Krv/3s4s1Hd2nkww4p6iAkwZrbARv1P+Ofzs0VX+E4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742965315; c=relaxed/simple;
	bh=7d8zc1Uh+Cu6Pmybxq72LMlRKqP02Hv/qEnXKUgVxNQ=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=mcmhlFU2U4OPxmT3KcmDL/eMpXBVV80PEVGWfzgorRnafXXkx1ksiMLERGFwSmV43hKxrmQmx2PPCKORIIzSPqLk1dak7aEtEQh6bAXaN6DOPdNl7RZRTn2HPod/XoAd4QQm3pfIzoFou6WSovY+BJKlqMMLjH9+uk+inf2eSpc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=R3BmUlfO; arc=fail smtp.client-ip=40.107.220.63
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kRwPOI+ssIrgHw0naUHNQa6kWkYYNWIviXsv9+Ni9Mnp1vdSAfQZqTjtjo+jiKRQid7mjscTyxBDTe4BPOjm9fMhfV0rSHkYsAv4BqRFhLNuyyd7nkNgip86FYZm6U+SYDKzNWL0EIIAr96ITrSZgX6uCYPwDx9G1ih9v7qx/xldJl55tTbzS3S5R+XSt8OdIQg+ggxi2AaW29d7f5Mm66wiANukEKjINn+ZT+b2IX1+QrkvIU/UCrJ8KsUHmhdukt01hDWoAX7S6qNNCMvgBmNJxIfoqgf2POYolgLgjFYRRrk+5seWHTeaOqMy3vBxwh4hCchvcoKPxoQVA0XAdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mCJuwk4J6Xmz2FR4NyHIzcJ+B7q2tjDGhln32EoxU64=;
 b=nmjoav79WZ2n2ZxrkXZ4+y54VYdO3b9uVX+5KWkpckBahijaIR0EYbtOaB8YtIMGYRPEUfs5EhMVF6yYqu5JHGzcG0PPbfEUBYCTd34wdNU4MsuDr2NqeRSOBKLiV9TWMlBBIn3XD0WGXbqlhpXhpKhb5Co5m4rErDyw2h1HoVgc0nitIiKiAdx+mBGAAlpCaxdz/FZpQiuOqX9ixc6tzJJ1WhcQtkBCAzhBQudkDk5k4Ji8fwL24f0FFWPTWB5CcwnfXqgbmh3BCYqe8zhLLjUK/+2kXfLpxhih7pMj3Bhqy38SbmNIjVlRNO/6AusI3g9m9IzndayKuYLswoLfKA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mCJuwk4J6Xmz2FR4NyHIzcJ+B7q2tjDGhln32EoxU64=;
 b=R3BmUlfO6QYlvYMjb2gRPYT6cOpbvcqOWojl+Cdqczk3qvBMEwSBjNr98XMofEoSOu/Qu9PT1FEfLtPf5aZd/j7vsNNPGKWZWpyzdpVfRFh4h9HShGRyCsq0kQ4pt8Q0ygdHldYtdONStcr2Rz8vkmhGKzYKHgG0sLPNJppbK7c=
Received: from SJ2PR12MB8739.namprd12.prod.outlook.com (2603:10b6:a03:549::10)
 by IA0PR12MB7530.namprd12.prod.outlook.com (2603:10b6:208:440::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.42; Wed, 26 Mar
 2025 05:01:50 +0000
Received: from SJ2PR12MB8739.namprd12.prod.outlook.com
 ([fe80::29bb:9aa:2a72:df1b]) by SJ2PR12MB8739.namprd12.prod.outlook.com
 ([fe80::29bb:9aa:2a72:df1b%3]) with mapi id 15.20.8534.040; Wed, 26 Mar 2025
 05:01:50 +0000
From: "Katakam, Harini" <harini.katakam@amd.com>
To: Andrew Lunn <andrew@lunn.ch>, =?iso-8859-1?Q?Th=E9o_Lebrun?=
	<theo.lebrun@bootlin.com>
CC: Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
	<davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Jakub Kicinski
	<kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Rob Herring
	<robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>, Nicolas Ferre <nicolas.ferre@microchip.com>, Claudiu
 Beznea <claudiu.beznea@tuxon.dev>, Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>, Samuel Holland <samuel.holland@sifive.com>,
	Richard Cochran <richardcochran@gmail.com>, Russell King
	<linux@armlinux.org.uk>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>, Gregory CLEMENT
	<gregory.clement@bootlin.com>, "netdev@vger.kernel.org"
	<netdev@vger.kernel.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linux-riscv@lists.infradead.org"
	<linux-riscv@lists.infradead.org>, "linux-mips@vger.kernel.org"
	<linux-mips@vger.kernel.org>, Thomas Petazzoni
	<thomas.petazzoni@bootlin.com>, Tawfik Bayouk <tawfik.bayouk@mobileye.com>
Subject: RE: [PATCH net-next 07/13] net: macb: move HW IP alignment value to
 macb_config
Thread-Topic: [PATCH net-next 07/13] net: macb: move HW IP alignment value to
 macb_config
Thread-Index: AQHbmpXdimvWxTuoTUe8kI1qHgz0XrN+FQEAgAR/5YCAAA0jAIACOyiA
Date: Wed, 26 Mar 2025 05:01:50 +0000
Message-ID:
 <SJ2PR12MB8739A1E03E116F9D6A312EB99EA62@SJ2PR12MB8739.namprd12.prod.outlook.com>
References: <20250321-macb-v1-0-537b7e37971d@bootlin.com>
 <20250321-macb-v1-7-537b7e37971d@bootlin.com>
 <45b3e613-90c6-4499-b50b-383106172184@lunn.ch>
 <D8OOPAXK16CI.3TE75O760JRSL@bootlin.com>
 <967fcb66-6a64-4e97-8293-a38b0ef1bc01@lunn.ch>
In-Reply-To: <967fcb66-6a64-4e97-8293-a38b0ef1bc01@lunn.ch>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_ActionId=782d21aa-4929-4c1e-9040-a62f9cf00242;MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_ContentBits=0;MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Enabled=true;MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Method=Standard;MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Name=AMD
 Internal Distribution
 Only;MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_SetDate=2025-03-26T04:40:21Z;MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Tag=10,
 3, 0, 1;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ2PR12MB8739:EE_|IA0PR12MB7530:EE_
x-ms-office365-filtering-correlation-id: e7b8b480-76ef-4a58-6db8-08dd6c235170
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|366016|7416014|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?6RHcrkqr/t64JxoYcePf+8W83HJDmPpusRSyuq6Zu21y8RB9fx2MmKts6G?=
 =?iso-8859-1?Q?nBH8LtjuAF69iLgVc6IF1u4xHkWafYCLfvXm8g+hi+LnQQcKWEjHypJaw3?=
 =?iso-8859-1?Q?1mhn7A03jGlsCtXgr67PvgPxBhmsP1LJDBnICCRRC7DQMOg9Th/1qye6lM?=
 =?iso-8859-1?Q?ontIMuhfheBjaXfCrZhpAicI4OCcBuqpyFzIbrd1I0B1yyYfXaI3+2u6Al?=
 =?iso-8859-1?Q?pJYeyYrhLMmWmfS/WK+n9jKw4QKRvasSw0iMxFrFVOwXzpssl8rAxN78/L?=
 =?iso-8859-1?Q?lG2jiFtNVjAc+7wJL0YNAwkaI4jKhiswuNQZf8Ckya6ZTNajtqaAVJkPgY?=
 =?iso-8859-1?Q?pC3Od9RWipZNMH6cEBv4LE+xh93Lkn1IE+p5aRkxa20gQ1yvsxOvD/1acg?=
 =?iso-8859-1?Q?21hnMRC0I+X27UIQua1/bqi2Q3d+VgGvosKpqOr6FVNyLa/ugJe4gX5SmI?=
 =?iso-8859-1?Q?knEf7NgajzoclUENXMWtnop9yH7gsk6mq+CRed4tb5WwUwcNZKN7x5Kx9j?=
 =?iso-8859-1?Q?SE+RpQNrwvtb6ji85OcJ3xcFV7jrtPdM2aHVi49mh/sVmSfYRHysuEDnku?=
 =?iso-8859-1?Q?I8iPIxSDGkLrb/WQxoTabP4TdnRFX4fmoSdPv/cXKdgBQIpowoSBEjW7E/?=
 =?iso-8859-1?Q?u03l0qMT5BmVSMTTsj8tyc3eKtxmU15hx5ghy34efnaMYoHoocwTY3seUR?=
 =?iso-8859-1?Q?S/IcEuYxE6I5ZpVhn69jJa/Y1zoDgUwAqY3KDmNXaS1KUyxCXJHnQHzpX0?=
 =?iso-8859-1?Q?CECykHIaJJjFHn3+hB0IO6zshCsNgJ5e5E7xphcIaDkDxCwoHalVgcuema?=
 =?iso-8859-1?Q?SwmRSFV2SRy3iSzbfIMOLqjqRuUXpVOLP/t69O/2y4UxtQHlh6LU1Miv9L?=
 =?iso-8859-1?Q?fpLgpRaxerLxXdIX4Q9KMgSdvns9saTd5vhR7deQLXKhrQEVeUs1DCFwDM?=
 =?iso-8859-1?Q?I3rQq/1clsNoXJPZ0os08G7X30UyRBoCFQI4btnYmMULTU6Ncra54udVMu?=
 =?iso-8859-1?Q?xRjWNu4uHv3ud12ZBXt0mi8Zj9F6VojfFInUWK9jkXBcUntk6m7wnR1Vbx?=
 =?iso-8859-1?Q?qeI5BE4dDlgOQ0h8Is/BwVebFYqXH5MXbDAqrt9bsWF9gvpE/l0kEvFl2k?=
 =?iso-8859-1?Q?ze8dvUd33Cr36TgA5J3c99rp3jf3C9Mdx60eoh/2MAVyy6QJlA2PNIIkMU?=
 =?iso-8859-1?Q?bATZTwOfHGX67Or18IlMMqqS6DrK9jb0NsTvabmvjr2ANquIr9copBrtRw?=
 =?iso-8859-1?Q?qBbJ5WnEx96P3unGoOKm4or5QGiU+iTJZBOn0ldGSpg99oQZhBih9IePvo?=
 =?iso-8859-1?Q?ORsQZgNcTyMiPQZ84gj1tqSn9Xmeuz62qJcZamsympsYFEpipaPN24vRAs?=
 =?iso-8859-1?Q?IQ4TygD1qstxZikZHpCPizDikPixwYNqtqe1J/W8hT8ZjDSnD2djazPQC8?=
 =?iso-8859-1?Q?JBwwBa2tAS2FtTcyRUsIiGBPP1gI9vnG7Y7Ke1gYbBR2E9LpFDVGAppZBv?=
 =?iso-8859-1?Q?HtrhWJudicAp0jcQ0W3fAJ?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR12MB8739.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(7416014)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?Czq2SMFaD2F1M+Pr6Z5e3UBRApGA0NTtaiNNXn2zv1B5+8B6bBkIiCd9oo?=
 =?iso-8859-1?Q?YagqdpuyKnIzLdq3QZMN4v679ZRlclga9gBbBETDAS3eXIDqzz8t4c06iO?=
 =?iso-8859-1?Q?3VfzXEU5IGd2/VhORBdCQaHu1qz1tl7HFCsCTPSvhZEPfYcWKdF/3n/poa?=
 =?iso-8859-1?Q?5VvdYEMJz2kRPA/RJ15POCSc1Du0x55SS3rlLR7Y6RJ+vGKO5WFHO0VbJg?=
 =?iso-8859-1?Q?dC0r5zDDXvitjLRE2rxcBe8Wo/nUH+MSohr04oTE30UZLMZzLtorYt8P9v?=
 =?iso-8859-1?Q?E9sXWfPhcoTXYhZjzmPRpXwP6hu9ORSU67t3tDSLr4uI7vVEb5R2q8TCIO?=
 =?iso-8859-1?Q?sea04zn7pVPfXGzspZFiKha9WLQl3Ft/tXorl1ox5Qr8KD8+/3m01Ipaxt?=
 =?iso-8859-1?Q?TXd+vMzSP2+IsvxdmoIGnNJC0ExmwDc0ITj6TSXQn6PYlX3u4tQSXyGTvn?=
 =?iso-8859-1?Q?gb/09QHmVMjW+CCjntAGktimAzuR5xd9fol7nirOo38iJPzG+WFENgQFDN?=
 =?iso-8859-1?Q?Mr9sIHRXAbTSQv4AlQjZLVmqG2xE3zb+PRGZk6ItakU1YvXTNfBY0eHC7S?=
 =?iso-8859-1?Q?4CshJdjuulpNy/gAysvqKc+76kXieKlmb/9vWjDttMXnrFP5DVL0w9SgX/?=
 =?iso-8859-1?Q?9OjRmVhZAvdEh9m7VPCEeOlJzLZdguxJFpzXK41mkYvmn8Zn3jaoh17P4H?=
 =?iso-8859-1?Q?ODCTSIUqcJYGxGg8wMjuresflCMPfBs1Dmw3DUU7i4nLaApcplshKbOJ+6?=
 =?iso-8859-1?Q?Ebox8y1qOKv0Cp7G3Gh2hNdcxI4XKVOWFjMFfjvUbHeVgbgOuI4Vx0zlc6?=
 =?iso-8859-1?Q?Yg7/IzmivlcFiFKdrSR5mOklQb0arJxo4Ic1reYCJ9xFIrbd7Yf5Dk4i94?=
 =?iso-8859-1?Q?5hbV7nziplLGLOBTfvAdNa0byjO4fzOfPnTngXg6PKmWHNgVjpiH1bgGNb?=
 =?iso-8859-1?Q?oRBsAE2+Ym1IPWvHnMMSqTMQFEPPgW847QaypuOWPm6xLMQFjMEWiy+tkd?=
 =?iso-8859-1?Q?WRzKH0es48r4laeZIiL0ilIu7mQ5nCHZxojHuATzI05Xqlg2IEnMtv4QAa?=
 =?iso-8859-1?Q?P6bYX2Rc6AHufye+3mwk+8SA7xITeXXR/mD8JC+ajwxOjEmDzR4fRoTV2Q?=
 =?iso-8859-1?Q?nfT0V/dziYVtCWDepTGVVftyWtzEYMRM7WawjbW9mlfdvcFJkuMFiCyzOV?=
 =?iso-8859-1?Q?0ApNXtV1yb8CIIISDt1Qse7ApHNyZ+ma+Bovof995zliReUeQD0nzVEx5a?=
 =?iso-8859-1?Q?WkXE6QLSXMjV6e3AU4GNTC6logZH11r70n2LYKvXY6Wz2YRfgMMcQj8kKj?=
 =?iso-8859-1?Q?M488ZnzYllPh1ZCRPs9+MRD6pqr1SINuSPtjBKcenYN/JWRdXcMTCmLtXI?=
 =?iso-8859-1?Q?V7G9Bd5CpT1fp5oYECEAXI5qlgHsI4btytFEPTS/oATpVM0fLRch/um3qO?=
 =?iso-8859-1?Q?Wr6f25Wxhce0FS1XCkCwQKZ4U5Ez9MomlIcwMsVTtr4e7+gLAZnOlswI3O?=
 =?iso-8859-1?Q?XDwGu7fdrF+1e1niOunKlF+SAYUzdbNPuqB44HVSol8kfwwwk18nJHx8Ip?=
 =?iso-8859-1?Q?xur8YC4nJwPis/XXaBPRxggeyjZyhLUOoYbL1tBRKftVYYe/KCEmPvUjTs?=
 =?iso-8859-1?Q?XtAtxHFu3BJOE=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR12MB8739.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e7b8b480-76ef-4a58-6db8-08dd6c235170
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Mar 2025 05:01:50.2413
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JBRPMncZQ6oziIMy/QdcHsge/R9/NpctfdVhAM3UDOAw6xdgdoUKbc+dmySLcrlK
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB7530

[AMD Official Use Only - AMD Internal Distribution Only]

Hi Theo,

> -----Original Message-----
> From: Andrew Lunn <andrew@lunn.ch>
> Sent: Tuesday, March 25, 2025 12:06 AM
> To: Th=E9o Lebrun <theo.lebrun@bootlin.com>
> Cc: Andrew Lunn <andrew+netdev@lunn.ch>; David S. Miller
> <davem@davemloft.net>; Eric Dumazet <edumazet@google.com>; Jakub Kicinski
> <kuba@kernel.org>; Paolo Abeni <pabeni@redhat.com>; Rob Herring
> <robh@kernel.org>; Krzysztof Kozlowski <krzk+dt@kernel.org>; Conor Dooley
> <conor+dt@kernel.org>; Nicolas Ferre <nicolas.ferre@microchip.com>; Claud=
iu
> Beznea <claudiu.beznea@tuxon.dev>; Paul Walmsley
> <paul.walmsley@sifive.com>; Palmer Dabbelt <palmer@dabbelt.com>; Albert O=
u
> <aou@eecs.berkeley.edu>; Alexandre Ghiti <alex@ghiti.fr>; Samuel Holland
> <samuel.holland@sifive.com>; Richard Cochran <richardcochran@gmail.com>;
> Russell King <linux@armlinux.org.uk>; Thomas Bogendoerfer
> <tsbogend@alpha.franken.de>; Vladimir Kondratiev
> <vladimir.kondratiev@mobileye.com>; Gregory CLEMENT
> <gregory.clement@bootlin.com>; netdev@vger.kernel.org;
> devicetree@vger.kernel.org; linux-kernel@vger.kernel.org; linux-
> riscv@lists.infradead.org; linux-mips@vger.kernel.org; Thomas Petazzoni
> <thomas.petazzoni@bootlin.com>; Tawfik Bayouk <tawfik.bayouk@mobileye.com=
>
> Subject: Re: [PATCH net-next 07/13] net: macb: move HW IP alignment value=
 to
> macb_config
>
> On Mon, Mar 24, 2025 at 06:49:05PM +0100, Th=E9o Lebrun wrote:
> > Hello Andrew,
> >
> > On Fri Mar 21, 2025 at 10:06 PM CET, Andrew Lunn wrote:
> > > On Fri, Mar 21, 2025 at 08:09:38PM +0100, Th=E9o Lebrun wrote:
> > >> The controller does IP alignment (two bytes).
> > >
> > > I'm a bit confused here. Is this hard coded, baked into the silicon?
> > > It will always do IP alignment? It cannot be turned off?
> >
> > Yes, the alignment is baked inside the silicon.
> > I looked but haven't seen any register to configure the alignment.
> >
> > Sorry the commit message isn't clear, it needs improvements.
> >
> > >>  skb_reserve(skb, NET_IP_ALIGN);
> > >
> > > Why not just replace this with
> > >
> > >         skb_reserve(skb, 2);
> >
> > On arm64, NET_IP_ALIGN=3D0. I don't have HW to test, but the current
> > code is telling us that the silicon doesn't do alignment on those:
>
> This is part of the confusion. You say the hardware does alignment, and t=
hen say it
> does not....
>
> >    skb =3D netdev_alloc_skb(...);
> >    paddr =3D dma_map_single(..., skb->data, ...);
> >    macb_set_addr(..., paddr);
> >
> >    // arm   =3D> NET_IP_ALIGN=3D2 =3D> silicon does alignment
> >    // arm64 =3D> NET_IP_ALIGN=3D0 =3D> silicon doesn't do alignment
> >    skb_reserve(skb, NET_IP_ALIGN);
> >
> > The platform we introduce is the first one where the silicon alignment
> > (0 bytes) is different from the NET_IP_ALIGN value (MIPS, 2 bytes).
>
> This is starting to make it clearer. So the first statement that the cont=
roller does IP
> alignment (two bytes) is not the full story. I would start there, explain=
 the full story,
> otherwise readers get the wrong idea.
>
> > >>     Compatible             |  DTS folders              |  hw_ip_alig=
n
> > >>    ------------------------|---------------------------|------------=
----
> > >>    cdns,at91sam9260-macb   | arch/arm/                 | 2
> > >>    cdns,macb               | arch/{arm,riscv}/         | NET_IP_ALIG=
N
> > >>    cdns,np4-macb           | NULL                      | NET_IP_ALIG=
N
> > >>    cdns,pc302-gem          | NULL                      | NET_IP_ALIG=
N
> > >>    cdns,gem                | arch/{arm,arm64}/         | NET_IP_ALIG=
N
> > >>    cdns,sam9x60-macb       | arch/arm/                 | 2
> > >>    atmel,sama5d2-gem       | arch/arm/                 | 2
> > >>    atmel,sama5d29-gem      | arch/arm/                 | 2
> > >>    atmel,sama5d3-gem       | arch/arm/                 | 2
> > >>    atmel,sama5d3-macb      | arch/arm/                 | 2
> > >>    atmel,sama5d4-gem       | arch/arm/                 | 2
> > >>    cdns,at91rm9200-emac    | arch/arm/                 | 2
> > >>    cdns,emac               | arch/arm/                 | 2
> > >>    cdns,zynqmp-gem         | *same as xlnx,zynqmp-gem* | 0
> > >>    cdns,zynq-gem           | *same as xlnx,zynq-gem*   | 2
> > >>    sifive,fu540-c000-gem   | arch/riscv/               | 2
> > >>    microchip,mpfs-macb     | arch/riscv/               | 2
> > >>    microchip,sama7g5-gem   | arch/arm/                 | 2
> > >>    microchip,sama7g5-emac  | arch/arm/                 | 2
> > >>    xlnx,zynqmp-gem         | arch/arm64/               | 0
> > >>    xlnx,zynq-gem           | arch/arm/                 | 2
> > >>    xlnx,versal-gem         | NULL                      | NET_IP_ALIG=
N

Thanks for the patch. xlnx,versal-gem is arm64 and NET_IP_ALIGN is 0.

AFAIK, IP alignment is controlled by the register field " receive buffer of=
fset "
in the NW config register. The only exception is when " gem_pbuf_rsc " i.e.
receive coalescing is enabled in the RTL in the IP. In that case, the Caden=
c
specification states that these bits are ignored.
So to summarize, if RSC is not enabled (see bit 26 of designcfg_debug6),
then the current implementation works for all architectures i.e. these two
statements are in sync:
config |=3D MACB_BF(RBOF, NET_IP_ALIGN);  /* Make eth data aligned */
skb_reserve(skb, NET_IP_ALIGN);

Hope this helps simplify the patch (and also fill up the table that Andrew =
suggested)

Regards,
Harini

>
> I'm not sure this table is useful. What might be more interesting is
>
>      Compatible             |  architecture |  hw_ip_align | value of NET=
_IP_ALIGN
>
> We can then see if there are cases when the 3rd and 4th column differ.
>
>       Andrew


