Return-Path: <linux-mips+bounces-11591-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E906BB5717
	for <lists+linux-mips@lfdr.de>; Thu, 02 Oct 2025 23:09:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C02163C0AD3
	for <lists+linux-mips@lfdr.de>; Thu,  2 Oct 2025 21:04:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C061F286402;
	Thu,  2 Oct 2025 21:02:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cisco.com header.i=@cisco.com header.b="LHcSoneJ"
X-Original-To: linux-mips@vger.kernel.org
Received: from alln-iport-2.cisco.com (alln-iport-2.cisco.com [173.37.142.89])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4FC5283128;
	Thu,  2 Oct 2025 21:02:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=173.37.142.89
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759438922; cv=fail; b=B36++/InDm4fqx6XATwknTsdU60PFqogyxFuOY7wSEhKhQcsRMdiDAtdW9geuPlREvKRSApFG5/xAUREeYHZ+2XCpFvAlpgpKs2Zg9z9anFbICLVUQH7JbnLsMbaaaVONHvlHBvu4dydCDti23Vx43cUxeEtIv7QSJL0DsOYBaQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759438922; c=relaxed/simple;
	bh=7yRFr0gyErQDVC+ftsNEpsM1rQ6rJpM3rRjAo96BzcA=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=OL94odc4YuZMfKIon+BvvkFBeMAHp+ewUNTb586IBTxLVivJQysq/mhl1P/aiVWtXt8inRuKgaJ7DAlTtYoHP2cumts5lcImQgu/ej3ZMQsB1VUtYcCEZIKOnACPdlF+tfi05PwY4Mf3x3TabBt67szgHtIFmCHFNtB2Cyqkkj8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cisco.com; spf=pass smtp.mailfrom=cisco.com; dkim=pass (2048-bit key) header.d=cisco.com header.i=@cisco.com header.b=LHcSoneJ; arc=fail smtp.client-ip=173.37.142.89
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cisco.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cisco.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=1334; q=dns/txt;
  s=iport01; t=1759438920; x=1760648520;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=xGd93bX9ZBRMuEeMK37hA54wHci0UoVOd0Y97cGIA6E=;
  b=LHcSoneJauxHPbzE7EBPMK7MYX2D+nBkaqgrZxOpoG+mcBJTmea8mQ6D
   BirhSmCDc61tyIt3HWBK60aeFCm6ayxnuS6JwpLYithzu1Z3P8/xIHSNy
   yBWeZspdH/cLEUSz6pz+Op5MFf+DRkBMhZ8Yi+jBhM+EZqlxqZNzR03An
   1FXGeoZYom8SYGKmFtXUW0fU+HnKdMQJneVPaXUlxI+KOPXoUjBe2IXZ5
   npoFPrB0sgyirXBU7Qq+Wtzey99+qw+DiwpbfSaRhQYbM7aF+/DMVcoO0
   K4SBLcxh4ASEhD28obzLSyvgj4Yzph37oUlSshx8XCqG8yHcx/mbipgOZ
   g==;
X-CSE-ConnectionGUID: ZSCkGRwDQh6n5BW+6rh6tQ==
X-CSE-MsgGUID: KaEANEsoQaOmq1MGJz9aQA==
X-IPAS-Result: =?us-ascii?q?A0A8AAC25t5o/5QQJK1aHQEBAQEJARIBBQUBQCWBGggBC?=
 =?us-ascii?q?wGBbVIHggUSiGkDhE1fhlWCIQOFeoxVHIsvgX8PAQEBDQJRBAEBhQcCjEYCJ?=
 =?us-ascii?q?jQJDgECBAEBAQEDAgMBAQEBAQEBAQEBAQsBAQUBAQECAQcFgQ4ThlyGWwEBA?=
 =?us-ascii?q?QMSKD8QAgEIGB4QECElAgQOJ4VTAwECo2cBgUACiit4gTSBAeAmGIExAYhQA?=
 =?us-ascii?q?YVshHcnG4FJRIQ/PoRDhkQEgiKBFpAxj1BSeBwDWSwBSwo1DDNtQwOBMksFN?=
 =?us-ascii?q?2gSQHeEFIQegxZygXRXQYFLGIIOcQ8GgRUZSQICAgUCQz5agRAGHAYfEgIDA?=
 =?us-ascii?q?QICOlcNgQR0AgIEgi+BEoIqD4FvA3g9NxQbBp0uLRBSS2WBEJNWgyMBsB8Kh?=
 =?us-ascii?q?ByiN4NxjROZVJkGpAiFDgIEAgQFAhABAQaBaDyBWXAVgyNRGQ/VMIE0AgcLA?=
 =?us-ascii?q?QEDCZNnAQE?=
IronPort-PHdr: A9a23:tz6bXxBrLVELTRaP/m6VUyQVXRdPi9zP1kY98JErjfdJaqu8us2kN
 03E7vIrh1jMDs3X6PNB3vLfqLuoGXcB7pCIrG0YfdRSWgUEh8Qbk01oAMOMBUDhav+/Ryc7B
 89FElRi+hmG
IronPort-Data: A9a23:vE/K9ak8CPELW5an1nwYNSPo5gzpJ0RdPkR7XQ2eYbSJt1+Wr1Gzt
 xIfWWiOa/+PambycohwPd+w90kDvMLQmIA2SQI4pCk0RVtH+JHPbTi7wugcHM8zwunrFh8PA
 xA2M4GYRCwMZiaC4E/raP649CMUOZigHtLUEPTDNj16WThqQSIgjQMLs+Mii+aEu/Dha++2k
 Y20+p231GONgWYubztMs/jb83uDgdyr0N8mlg1mDRx0lAe2e0k9VPo3Oay3Jn3kdYhYdsbSb
 /rD1ryw4lTC9B4rDN6/+p6jGqHdauePVeQmoiM+t5mK2nCulARrukoIHKZ0hXNsttm8t4sZJ
 OOhGnCHYVxB0qXkwIzxWvTDes10FfUuFLTveRBTvSEPpqHLWyOE/hlgMK05Fb8j0eVYO35iz
 PxGLm0nUVPdneLo3IvuH4GAhux7RCXqFIobvnclyXTSCuwrBMmaBa7L/tRfmjw3g6iiH96HO
 JFfMmQpNUqGOkEfUrsUIMpWcOOAinD5cjBct1u9rqss6G+Vxwt0uFToGIeLKoXUFJgJxi50o
 Erl9knQJDwBM+WW7j+cq1eDpP2elBrSDdd6+LqQs6QCbEeo7mgSDgAGEFi2u/+0jmagVN9Fb
 U8Z4Cwjqe417kPDZt38WQCo5XuFpgU0RdVdCas55RuLx66S5ByWblXoVRZIbNgg8ctzTjsw2
 xrQxpXiBCdkt/ueTnf1GqqokA5e8BM9dAcqTSQFVgACpdLkpekOYtjnFb6PzIbdYgXJJAzN
IronPort-HdrOrdr: A9a23:/JjsYK/YmMn4mvYDfEFuk+Gkdr1zdoMgy1knxilNoENuA6+lfp
 GV/MjziyWUtN9IYgBfpTnhAsW9qXO1z+8S3WGIVY3SEjUOy1HYXb2KirGSggEIeheOudK1up
 0QCZSWZOeAaWSSyPyKnzVQcOxQgOVvkprY+Ns2pk0FJWoFGsMQijuRSDzrbnGeLzM2fKbRYa
 Dsnfav0ADQAUj/AP7LYUXtdtKz1OHjpdbNWzJDLRgh7wWFkDOv75DHMzXw5H0jegIK640PtU
 zenSLExojLiZyGIxnnuFP73tBzop/M29FDDMuDhow+MTP3kDulY4xnRvmroC01iPvH0idprP
 D85zMbe+hj4XLYeW+45TH33RP77Too43j+jXeFnHrYp9DjTj5SMbsFuWsZSGqc16MThqA77E
 t55RPBi3ORN2KZoM3J3amOa/itrDvunZNtq59Is5UVa/pvVFYYl/1swKoSKuZCIMo/g7pXTN
 WHy6rnlatrWELfYHbDsmZ1xtuwGnw1AxedW0AH/teYyj5MgRlCvgElLeEk7z89HagGOtJ5zv
 WBNr4tmKBFT8cQY644DOAdQdGvAmiIRR7XKmqdLVnuCalCYhv22tLKyaRw4PvvdI0DzZM0lp
 iEWFREtXQqc0arDcGVxpVE/h3EXW34VzXwzcNV4YR/p9THNffWGDzGTEprn9qrov0ZDMGeU/
 GvOIhOC/umNmfqEZYh5Xy2Z3CTEwhpbCQ4gKdNZ7vVmLO/FmTDjJ2uTMru
X-Talos-CUID: 9a23:XRwgG2BD86SHfIr6Extc3007IN8JS32Dyir6HAzmE2Y3VITAHA==
X-Talos-MUID: =?us-ascii?q?9a23=3ABoeD3wxqBfFCg/xlcdcy5tMGrveaqIenJWkrvI4?=
 =?us-ascii?q?BgsCjMDUpHhi/nmW+e6Zyfw=3D=3D?=
X-IronPort-Anti-Spam-Filtered: true
Received: from alln-l-core-11.cisco.com ([173.36.16.148])
  by alln-iport-2.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 02 Oct 2025 21:00:52 +0000
Received: from rcdn-opgw-1.cisco.com (rcdn-opgw-1.cisco.com [72.163.7.162])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by alln-l-core-11.cisco.com (Postfix) with ESMTPS id 3BB0618000395;
	Thu,  2 Oct 2025 21:00:52 +0000 (GMT)
X-CSE-ConnectionGUID: 0vCAJSyeSc6isM5CMGRh+Q==
X-CSE-MsgGUID: guAaCnXdSs2JV+iln+9hvw==
Authentication-Results: rcdn-opgw-1.cisco.com; dkim=pass (signature verified) header.i=@cisco.com
X-IronPort-AV: E=Sophos;i="6.18,310,1751241600"; 
   d="scan'208";a="36045921"
Received: from mail-ds2pr08cu00105.outbound.protection.outlook.com (HELO DS2PR08CU001.outbound.protection.outlook.com) ([40.93.13.53])
  by rcdn-opgw-1.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 02 Oct 2025 21:00:51 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nJDrAxV0nQuEeW0z3gxFOMEgVfYq60oMhFSEM7T+aDGhFL9LwSDQIBu/TrfiYWJwOikBzYNtQC5VxPmgE9LWk34JZqud34w2bAO7MubZyyXSMYajKkctOwfWJO+HJyGJ22umSzvQ5DBmC6zUMwYyv9Lrdk/I5AOlA5883svDe4C/Biusf5mV+Qj6mSSS9dapPpFE9C4kf/7pjvDYLWps4vSfTJSvtQR6YX6iLwskw1J23S0vbgWcn1gaex8hK59k+cPdrWcZ5hGJKhIpqLFPqoSZDkS0bmma8WteTfCQIDg9D56c+FR2xdq4hIqZvmhzh48EI87+t3u/wlY3toFc3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xGd93bX9ZBRMuEeMK37hA54wHci0UoVOd0Y97cGIA6E=;
 b=eYn2hHCk5xF4gNCTuEkswVdid3wTaZcA3imqjeqq23kE0OyBIB7EnM6qF3DkAsiuc3tTG3uvVv8DvbABDkhqp0AusEKH9A2y4SYUXWO1lj20ZMxTg9w8mD3QQX6MNCI4/TS9oKCAWCOPsea40TLtWIK6oZD0VY/NDVHnGiWSNLVzFJRMi5feR04qEdJZzinTmjSnknNi6ZU24ZWXTFQLWcL6Mi8ho12BnFhK26BkT6aYJ7uU1oRxQZDaB4DkRlR1ALJPS94Z2ECP8R/4Mn8zu25YTytyCMVOos0M3UBRhmcE8ypAi/M7JLBOrFOyRNPzuensIHAwvjHj88nB+GNZTQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cisco.com; dmarc=pass action=none header.from=cisco.com;
 dkim=pass header.d=cisco.com; arc=none
Received: from CH3PR11MB8775.namprd11.prod.outlook.com (2603:10b6:610:1c7::5)
 by PH8PR11MB6753.namprd11.prod.outlook.com (2603:10b6:510:1c8::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.17; Thu, 2 Oct
 2025 21:00:48 +0000
Received: from CH3PR11MB8775.namprd11.prod.outlook.com
 ([fe80::d17a:fdd6:dfc9:19da]) by CH3PR11MB8775.namprd11.prod.outlook.com
 ([fe80::d17a:fdd6:dfc9:19da%6]) with mapi id 15.20.9160.017; Thu, 2 Oct 2025
 21:00:48 +0000
From: "Daniel Walker (danielwa)" <danielwa@cisco.com>
To: Dave Hansen <dave.hansen@intel.com>
CC: Will Deacon <will@kernel.org>, Christophe Leroy
	<christophe.leroy@csgroup.eu>, Rob Herring <robh@kernel.org>, Daniel
 Gimpelevich <daniel@gimpelevich.san-francisco.ca.us>, Andrew Morton
	<akpm@linux-foundation.org>, Pratyush Brahma <quic_pbrahma@quicinc.com>,
	Tomas Mudrunka <tomas.mudrunka@gmail.com>, Sean Anderson
	<sean.anderson@seco.com>, "x86@kernel.org" <x86@kernel.org>,
	"linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
	"linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, Thomas
 Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav
 Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, "H. Peter
 Anvin" <hpa@zytor.com>, "xe-linux-external(mailer list)"
	<xe-linux-external@cisco.com>, Ruslan Ruslichenko <rruslich@cisco.com>,
	Ruslan Bilovol <ruslan.bilovol@gmail.com>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 6/8] CMDLINE: x86: convert to generic builtin command line
Thread-Topic: [PATCH 6/8] CMDLINE: x86: convert to generic builtin command
 line
Thread-Index: AQHcM9+g3r8quaaplkmRsz//r+UKeQ==
Date: Thu, 2 Oct 2025 21:00:48 +0000
Message-ID: <aN7n_5oiPjk-dCyJ@goliath>
References: <20231110013817.2378507-1-danielwa@cisco.com>
 <20231110013817.2378507-7-danielwa@cisco.com>
 <00c11f75-7400-4b2a-9a5d-10fc62363835@intel.com>
In-Reply-To: <00c11f75-7400-4b2a-9a5d-10fc62363835@intel.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-Auto-Response-Suppress: DR, OOF, AutoReply
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH3PR11MB8775:EE_|PH8PR11MB6753:EE_
x-ms-office365-filtering-correlation-id: 27781819-f9c4-4fba-c143-08de01f6c34d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|366016|7416014|376014|38070700021;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?zwqlhdMFlE/T7l+eA8Zq86LdINOCPXZDBe5A/eslWkcGtQ4/xzrpQFK3RGNu?=
 =?us-ascii?Q?bHwHO7Cu97zVajmHxqv6igPmk6YylTxw3VAm4mnQIlUF/JS76o6ao5zs3vet?=
 =?us-ascii?Q?4rwLLxSEUC5j4+3BEL6BQEsmV1dQ/YwcoCF21n8C7chsSBRDIRQD+QlmfF54?=
 =?us-ascii?Q?SrenJbZyEgAeedHbhsapu9ftWfsDccki6eJ3OV/q7mXJ+U5KqaPiJJoYWndv?=
 =?us-ascii?Q?4JqlMSTHSwshAbWAeg3srxzbhtr3iJ9tpqv3W5W7z2TbxscIe8mcyYACeJOn?=
 =?us-ascii?Q?SYTWkqZG81YuSPlMFjaSpqa5vQz9bMpJ9p+gUgv6uq+fC4uQfvMCbEzvpmks?=
 =?us-ascii?Q?U9C8Q75MHx+kxevkkQmvASVpRr3PLGW4HygSsoyrJUU7fBtQd4E+I/hiN8NO?=
 =?us-ascii?Q?P19KMRN3LRC8zHVmjynMrVvnhzU998qXORxXpfe4DDE+tZ2HGmgX3IthQyqe?=
 =?us-ascii?Q?j8XmHu5P3rI8QjalmidiCOSt3qwKurupJvDp/jxpPWET2Y0EZBGUmw2TnbTx?=
 =?us-ascii?Q?y+BvHIH4+qH0E3Quf2bSQLAWp+VFNLQipgzqII+Z2v+XXPuzJpQ7GvZobpfv?=
 =?us-ascii?Q?F8oIYQ+foXxSW3s/a/gFBKX0qZdaq0ORv/swMXpSuksYnaR1nEkbQYOUM1ed?=
 =?us-ascii?Q?Ft5ntG3V8fiFkGHwSaDfJrJaJnuFSZ78Z5ECTyqfN50j5QRFZfIOF2mPmg0L?=
 =?us-ascii?Q?O1M7+DnY0cKZ5XEbS1D8WFm4pB/5YlzECbmETQ84J+htpLkfSxNjnSknIMK6?=
 =?us-ascii?Q?bGJ9SMLZK96nqbT7R58BxG7gbY3QV/3Wvy4WVgqlMRO/VmYKKi/EwP44P/9f?=
 =?us-ascii?Q?VeN4KX234zg+64B8hkF3csOTnoXnKxwAOFQQtAD0OMtulwDi4tQXbGzQ+uLC?=
 =?us-ascii?Q?KZDDuRoqUi7Xdv9HnMUX4UG1KndyO5D1XcbDx7BY7aSa+SM9V+d8EJDTMbOv?=
 =?us-ascii?Q?OrmabHd+uFovIcbjaNkD/P5SFc0YtaZ8tDu5pAc8gHm2sJVGz62AKu1D9cs7?=
 =?us-ascii?Q?pPb5CVW6FFNuyXqSBP6bwl3To5Agu7vj148+WBgA3f+vm7BhAaGJfpcoxeFg?=
 =?us-ascii?Q?ajboh+sFjR9Ym90R0lDc4VCnfytSHSGKcS3yHELKCCmnH5ZA+kbSfrY1tfqN?=
 =?us-ascii?Q?uLiO1BeWzHu+I6eut33baKjw3NkYCgnASSRx9D/viPbF2yO8P+sLQAcH18E+?=
 =?us-ascii?Q?Faw40NcF/WQShg+mFa9p4Yap7C5qxgP9gFbkC2gTJA21ziY0XKDY6pidS5cH?=
 =?us-ascii?Q?0hva4Tu+Oldjf/tIe2Blb9Auo64dK2LRCZJGDnEA6eHHdOlBozOvtIBT56Ln?=
 =?us-ascii?Q?ApRjKVIaO3yViPEC4gVdOmaMw85ylOgOnJTf5JsNb71IYmhLJzKcLrd8SFbr?=
 =?us-ascii?Q?giAzB1jr73R0l8go3wmspvjxldOz/Qk4Vy0ClS3N13k03/YFEhsKgSQmRCoq?=
 =?us-ascii?Q?WVdnjShDafCi4LIs5Xj0B5gFPCWfMNh8ERZnTo4yvLIIvNRdov3hgbK4WXp0?=
 =?us-ascii?Q?0uy1EAeJPH351zWD+IkCvgsCnOYQ9/AGggQD?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR11MB8775.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?X+LqjqPsqx34/iaV/wOl4eeaEMO8N94aNX2/qu8ZhdTmFJa1qLv0AujzrcVM?=
 =?us-ascii?Q?L1uhpO94EmITMJSnFrwQii57hBKbKKTDu6NQfwUYgwCINq9vcDKGdaxIzJ/g?=
 =?us-ascii?Q?0l5RraKmcVVWsGf3beq7TuqibYhbh0s6v8JwWWWrHSypb8T5V5MkYypjo8Gn?=
 =?us-ascii?Q?8dpT/u11ZExDoe+WgL0OMY6HR1I1Z91w/Nr6j0rq1XMkh5MBoMoryy6A/ufV?=
 =?us-ascii?Q?aqr6KaY6mG6iHXywMccq2hQ+z6N7By0XFfJR2Zsfug2CocWXoIvnk2alLWUu?=
 =?us-ascii?Q?pb1ZA7rUtbW9NBtGljN+4KZ0cLKlS8wzWCq4QhbEiqnF+M1WqOhBrf7dnoVI?=
 =?us-ascii?Q?6t5Sr6wsGY7Zpg6O+0YHG2PBUMFniTcumI9C+DF/G4Rft755mdWqmH/JKTyA?=
 =?us-ascii?Q?fmgEyJu94UfJp14d+3nWZ601nklne8MN0vVk8SA4ofKHQh0mSrCY5lcx+DQG?=
 =?us-ascii?Q?QQ7E1rvcyCbvKQKhvdxlUTipPm0k4worD32Hh5zf6TaoaIQj1OwF9dPkhtii?=
 =?us-ascii?Q?z4y4neOiAhtwLB3DeHrTSi57CVeANnN5UiZ+aHmwdenNqjCNW+tgsAFP3SDj?=
 =?us-ascii?Q?3c+3g/a7xwhCI0TNKoGCOZFoOIJcDTVAShXw1+olC3BdAA/kZXETleshkUq6?=
 =?us-ascii?Q?CVSegGTUnBXDMCUr9yi4sZ830CCEp9uw6PA/rIYEBMw43xCNocUF0JDFMj14?=
 =?us-ascii?Q?GWsB2rGV6kNtJUk/PgGatpYQteIi8t4F6tHOzb0XO7ponQ4s7UfRcHOn8+io?=
 =?us-ascii?Q?5RVhELFqfw2wkwPqBD14dog9XK/5I/l/OT2SOmlBOHUqR34+Wm7sGYAMV2FW?=
 =?us-ascii?Q?9MhkSCPexOmmUDsszygHwh8Q7AGkjqAaK+iGrSCxLsooBKEBmm6YDcsZhGKG?=
 =?us-ascii?Q?b9Ls1Jj+Ba+Mhqe8jHBKGbytYdPiEG2kz+NoFScLp+jzMY06PCXj58p0uA1T?=
 =?us-ascii?Q?87mr3uGr4srn0ITkSlc0g52yWlnOs297FCdwQpg+SAWe5Sa5OfWjzF9zR8EW?=
 =?us-ascii?Q?eX8VgJ917IaqOY/gosunD90z//pkJVbTt6pCVuMzL1Ng0JjRgKfIpmeYZvgr?=
 =?us-ascii?Q?26xKJo9P57sSxIqsOkBvjVktHFGFjPrICH3AMrP3ZRFX/nE7hYrOWoL08uLy?=
 =?us-ascii?Q?dQRBAvmyOP02yyetPkKp/yBWusnvSFRrrxRXc4wtmKlhgrhmBq6WFG4cYAl9?=
 =?us-ascii?Q?ZrZbm5SZ0e6ISyA0Mcuep08QJndrknKJk+9lCBarHAQewtq3+ZgVZiWvgePh?=
 =?us-ascii?Q?NUDe2as4jBR998ibly9+4k0m9rgCkjmlHLtUxexpe0yv3mUypSKMd7w7dKyV?=
 =?us-ascii?Q?XBeQ9jjilG+x7763R3bAveh33cHWUw4ivBz052Bb8iOAwhjjBBq+nj+p0cqV?=
 =?us-ascii?Q?OC0W0c9MTYIlSMFcDq29UZpxi0bKOOLHKdWqozlNj3jPjMTF8OxfAKbKl9sE?=
 =?us-ascii?Q?BZfAxSQfZa/aPcXWhcvAe1xzG4i+2MlhNGuNl3FVjrkn7AFGtxCzMxtljNo3?=
 =?us-ascii?Q?wzCMCdOlc8UvM9n39PdXK0FLL5zRFGnOoix1Zw8jeVl6xwYsUPELRu+NmHUe?=
 =?us-ascii?Q?qtqyMoxqBrra+dXGzsullEnWiehaHPfwjgSarWSZ?=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <62A03048CADC7F41B0F5C8D15B3804DC@namprd11.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: cisco.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8775.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 27781819-f9c4-4fba-c143-08de01f6c34d
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Oct 2025 21:00:48.3203
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 5ae1af62-9505-4097-a69a-c1553ef7840e
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Z0wjGrxkid9u7v3Bl9wQ0f64ehahsJ/JjRoMIFoY9eQMCdVaD53wXrc7MQqlT9YJ+cXeyzp4MIGcGsDCcZFhCw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB6753
X-Outbound-SMTP-Client: 72.163.7.162, rcdn-opgw-1.cisco.com
X-Outbound-Node: alln-l-core-11.cisco.com

On Thu, Oct 02, 2025 at 01:49:39PM -0700, Dave Hansen wrote:
> On 11/9/23 17:38, Daniel Walker wrote:
> >  arch/x86/Kconfig        | 44 +----------------------------------------
> >  arch/x86/kernel/setup.c | 18 ++---------------
> >  2 files changed, 3 insertions(+), 59 deletions(-)
>=20
> It would be really nice if you managed to get this rebased on current
> upstream and sent out again. I'd certainly ack the x86 bits if the
> Kconfig issue that 0day found was fixed up.
>=20
> Also, one nit on the cover letter:
>=20
> > There are a number of people who have expressed interest in these
> > patches either by asking for them to be merge or testing them. If
> > people are so inclined please continue to request them to be merge
> > or to ask the status of the next release. It's helpful to motivate me t=
o
> > release them again and for the maintainers to see the interest
> > generated.
>=20
> The way I'd suggest going about getting this merged is to solicit
> reviews and testing from folks and then get those annotations into the
> patches. As it stands, this series has zero tags in addition to the SoB
> tags which I assume were its authors.

How does one go about soliciting reviews from your perspective ? Typically =
I
just submit it in this fashion and whoever is interested reviews it.

Daniel=

