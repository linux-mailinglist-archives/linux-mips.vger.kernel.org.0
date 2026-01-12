Return-Path: <linux-mips+bounces-12851-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id A2484D11476
	for <lists+linux-mips@lfdr.de>; Mon, 12 Jan 2026 09:40:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id DBAA53072B2E
	for <lists+linux-mips@lfdr.de>; Mon, 12 Jan 2026 08:40:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6D3C334107E;
	Mon, 12 Jan 2026 08:40:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DOkM+5wD"
X-Original-To: linux-mips@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0990933D4F5;
	Mon, 12 Jan 2026 08:40:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768207215; cv=fail; b=Jel/SUxbe1S/3ypECkoyXRF1FEc/0q9X8jWWceLJ9ZRAnMAmZC5HbYAoQmem/2K83DdZx2FkmntHDHdlTcgkZmJd9aBg7OkOvYYgdefOrbNalgxgYGMOlLLlFrzmbv1xeLZyMslIpBtUs4hF173fzYBiA6j7s6qy5FiEEqO1oFk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768207215; c=relaxed/simple;
	bh=MNfU4PEqJj/lh82ShLuGHIz/p5V+/RNmqYEHGEWwsUY=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=CNCYaf/C+yqlHGFb7c8cnKusM/68qQjlygM3vCuO1heitFeLU5FjabXfdPruS5QtDa4VEsZd9pljh3QTdkxqErsMhDgaR9dbhkYjwVEW4pl2HITPh2ppNQRMr8zmBR6RkqB06JKfmg6sXhEfQa+QxtSzH44Cq7dCKcHjjFXAFIo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DOkM+5wD; arc=fail smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768207214; x=1799743214;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=MNfU4PEqJj/lh82ShLuGHIz/p5V+/RNmqYEHGEWwsUY=;
  b=DOkM+5wDex0xtahpZ/zDsWFVNC/f6Glv2Ca/kKOSfzj19+6W24pj7xHt
   zmx2Yc4dIHbBokJ7lXVzCOjVjDOFL7vsMxAJzoNL7yagesM0XPaGOXKzo
   jsDJ+5+s5NTM9/8cwcDiVE0ugwoXuayPCAGFv/kxbXPyEuGh0OJEWiaMs
   BqITtDxqyFOVLnL/RyOFo7+uBCx9kVDVU2nAD0vZH2tIWEmkKnLySQJLr
   QqRSTp4gRsG51SSMmPR1BEOpInP66hrXHW/7mfGm2wnyUusJhBSR4A5bW
   ytSJY/GZ6Pqev+C7niFm5ityaZY/7AkJhi9MsFjMX4N8edlTpXMGOQznD
   g==;
X-CSE-ConnectionGUID: XlVi0tgdTMm3ZqzAIF5Ilw==
X-CSE-MsgGUID: oNeXcmTaRWO36cO0YA+T2w==
X-IronPort-AV: E=McAfee;i="6800,10657,11668"; a="73110525"
X-IronPort-AV: E=Sophos;i="6.21,219,1763452800"; 
   d="scan'208";a="73110525"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jan 2026 00:40:13 -0800
X-CSE-ConnectionGUID: WMh2UOsUS4SUcGvASTa9Nw==
X-CSE-MsgGUID: DJ//HiizToesRi38a3kfcw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,219,1763452800"; 
   d="scan'208";a="235272320"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
  by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jan 2026 00:40:11 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 12 Jan 2026 00:40:11 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Mon, 12 Jan 2026 00:40:11 -0800
Received: from SJ2PR03CU001.outbound.protection.outlook.com (52.101.43.56) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 12 Jan 2026 00:40:11 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BKZrSa96SpEFegeq+Zfr4EShehG/0fL35uAgL0t4q8Uh3SyFtjYmtR2yQNaUxUC1iul04bu6Bu4weEJBeWnJjKqtHwf03EeOqGFAGDO9kekQ8a39ojSByuyHI2gnJn7hadR59kF64TYWuQvsJFZ5Up0jPtxjcgszX+csyXGBJTLPyP85/Bqf0qCV6xslxid+ZNcUtc+OekbLSud2NEoW4xB2FKupQUqhaLUbaKTQL5u5gb5m5caAu9N3Wk7P5/BYzaQwyumbv8JFeA+CGPR4vJAqtBizCs65QMc+N9Vs3KPZe9P+Jdm/NLusgm4fsWLNnakT37APUB4RQydYetMJhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0dmULebEXICOqWqJMIYcDuFdI2Tr2DG3qDLdDG4XxrM=;
 b=zAt4K4iOM2xZNgsoRHHYuYhEtMVi2hYpeKGA3iA1UFivWWJEE5ozyIbxP9/UIxWvuHrNo7zYKqShjeyp1S5AzZawkZ1lqu82b95Zn3tZBLUE4eNnbG9hTOeH9nBM4JeyQhCtfx4D89ahoHn7axGzSEFy6esvPxIhT81FNmM2sJbxwcziqD8ecK2G6C8YQnCCl7b2lCsl0DywIsSmYo5mTgxju/NbkGhZEXEcrp3wWETD42w2w771JlR8VFi4a1T+2lrNuSEZk7owXHlsWogr6gANrioNXCnP9ffb5w22mjPag3g+W+QwHB/rri9BmoUTjIDyP8N+dHByhY7qRuEK8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA1PR11MB7198.namprd11.prod.outlook.com (2603:10b6:208:419::15)
 by PH7PR11MB6748.namprd11.prod.outlook.com (2603:10b6:510:1b6::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.7; Mon, 12 Jan
 2026 08:40:09 +0000
Received: from IA1PR11MB7198.namprd11.prod.outlook.com
 ([fe80::2c4e:e92a:4fa:a456]) by IA1PR11MB7198.namprd11.prod.outlook.com
 ([fe80::2c4e:e92a:4fa:a456%6]) with mapi id 15.20.9499.005; Mon, 12 Jan 2026
 08:40:09 +0000
Message-ID: <eb84ecc7-e409-4e2e-b609-7fe68336feff@intel.com>
Date: Mon, 12 Jan 2026 10:40:03 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 06/13] mmc: sdhci-pic32: update include to use pic32.h
 from platform_data
To: Brian Masney <bmasney@redhat.com>, Thomas Bogendoerfer
	<tsbogend@alpha.franken.de>, Claudiu Beznea <claudiu.beznea@tuxon.dev>
CC: <linux-mips@vger.kernel.org>, <linux-kernel@vger.kernel.org>, Ulf Hansson
	<ulf.hansson@linaro.org>, <linux-mmc@vger.kernel.org>
References: <20260109-mips-pic32-header-move-v1-0-99859c55783d@redhat.com>
 <20260109-mips-pic32-header-move-v1-6-99859c55783d@redhat.com>
Content-Language: en-US
From: Adrian Hunter <adrian.hunter@intel.com>
Organization: Intel Finland Oy, Registered Address: c/o Alberga Business Park,
 6 krs, Bertel Jungin Aukio 5, 02600 Espoo, Business Identity Code: 0357606 -
 4, Domiciled in Helsinki
In-Reply-To: <20260109-mips-pic32-header-move-v1-6-99859c55783d@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: DU2PR04CA0187.eurprd04.prod.outlook.com
 (2603:10a6:10:28d::12) To IA1PR11MB7198.namprd11.prod.outlook.com
 (2603:10b6:208:419::15)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR11MB7198:EE_|PH7PR11MB6748:EE_
X-MS-Office365-Filtering-Correlation-Id: 9995d8aa-8f4d-4b36-418f-08de51b6317e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?cUpSWnBMOGNhMG9GQ2txSUZPOXNvd3M3THIxUHp5STBlSzJoSTJjVlJaUkFM?=
 =?utf-8?B?VGZCcE9FTmFXSFQ4Wit6aGEyVlBvWEo1RGpKdW5nYWMvWnFCL1hPV0hjV3B1?=
 =?utf-8?B?UVIrVGVCeSs2eEU4cGFYNUs3N1h2U1VpVjdLTW5wNWM4eElrN0g3TlQ2YVpI?=
 =?utf-8?B?bzQwWm54YzE4YXlPWThBL1BoNjdGWmZTZ2J3RmxCeUpOSkV6QmVRclRzdGZq?=
 =?utf-8?B?R3gwZlAzRU9oZ0czRTlUK29mYjJNZnF1R1llUFE3QkJuNDdHMnBTWUduaHBF?=
 =?utf-8?B?WUpHekR3M3hjaU5obGZlRzdnWmFHQUZHS0RoZlFiVmwyaDAzY3lla2lFVFdL?=
 =?utf-8?B?cm5ESUFkRjdtVmg4ZDQzd3I1NDB5YnNObHRhUFBva043SG5aZG9FVnF5VU9w?=
 =?utf-8?B?cm1kdk1naHRkNFZTMEdtM3dZYnVYRG8vaVh6QmUvL1VaTnI0Z1lwQ2pjOWlD?=
 =?utf-8?B?RVhVeDUyeHBjdmJHWUtUaDVvS1d1RzN1R0xNV1c3TjZEUERFTTUvY0VLU2or?=
 =?utf-8?B?TjZVWnVyTW4zMW1QVkZjenU4WHZqWFArbmZ2di9oRGVncXZxeEpieGlqc25H?=
 =?utf-8?B?RVJuS0V3VmVQS2FNc05lKzBRWFFkV0N6UVEwS3VZRm1ZRXFRK1FEN2dOdUdr?=
 =?utf-8?B?VXNZTDI5UVBmTGFhRVZzQXJ0eDVhNnZGUjY2SkZ4L2UzZVhqSmQ2SHk0cnd1?=
 =?utf-8?B?UjVNRzhzUUpGSXNDMXdWUFZvSUd4ZFVpeG8xekVpOFlSZHQrMFV4UDk5NHYx?=
 =?utf-8?B?dzlIRHUrSkhxSTlERTAxQjNlTTR0NFh5RjdHRVk2WGo0OXByMUZ2Ly9nODQx?=
 =?utf-8?B?M0ZVOWFGQ0o0TjZqRlg0V2pqRDRJQVBLU3JLek92NWU1L3dQZlZ2QWdEbC9k?=
 =?utf-8?B?WU44VjdEbXBGTDZvWXRXV25XRjY3K1ZnYjNvWVQ2aTBVMWR2VFNvZUlrb1pt?=
 =?utf-8?B?SWhpZFQ3Q09YcURXcTBZbUhDZVoyQlF5V25IM3NBYWpaV2xnUUJhKzZ1Y3RV?=
 =?utf-8?B?NVJRR0l4V2F1Mlg5aWZpOFJ4ckZvSDZVRm9tbW9JMmZJdlo5V0RtcU96WXBn?=
 =?utf-8?B?WFFlTnlIMk9xK2NKZmFPV3dhRHpxRzB5Y2RYNVBWeTlMcXAvQk5zNFNMKzhw?=
 =?utf-8?B?R3VvUWpNZVJpUEEyMHgvSkVqSjdIbmh6bGE1dWpweDZWNjRyNFI0dFNHQUVE?=
 =?utf-8?B?bzd6QlZFc0pUSFd3Y0NPVWhMcVd0S1BuZW1xK2FVSzZ2eHk0dTRaWnFVc1F5?=
 =?utf-8?B?UC9ieDVLTnZCYlFvWHUrWERGNXBPZGdNMG0rYlgvTjRsOWlCTHZmc0sxOXE4?=
 =?utf-8?B?UExaRGpoMFBHRFpnOUJjNWl0cFM0MHRIWEpYRkFxK05sUlFZeFA1Njc1QlFF?=
 =?utf-8?B?dVUrR2xWTUtFWGVhalNtZE1RcXJRNVVjelc1MXM0S0ZEeGcxa2w5c2NYYk52?=
 =?utf-8?B?Q3grZ2N5QWttQ3RNSDA1NWFKZk9CcXlzblR1dko4NFRVaTBaTlhyajRGdzhr?=
 =?utf-8?B?TGRrUldyL2wzb3VKSDBIZUY2SDdhcnltZUw5S0lCL2YvYTgyNXpFVldjOUI1?=
 =?utf-8?B?c0FteFRGbkt6UTJKUFduTW50QU5HNGtjN1BDUk03ZlZmc3JwSVd5WVFrWGxO?=
 =?utf-8?B?QnNkYmVPVTRTQ0t4Y3VpeHhpS2JpMmFqRkxXOW10ZUlJNFY0K3JWTVZ5MXlw?=
 =?utf-8?B?OTJoajVOcWQ2YWh4MzIydUIwenRKUElqQ01GbU1FWk9NVXZoamxHdWE0UGFm?=
 =?utf-8?B?REJ1SVQ3QUFxbEk2WHBhRk5IdUY3NHZuUWIydTRXcEZMalZaWkRZTHQ4R2Zr?=
 =?utf-8?B?NzJXYUV6NndzNmM5UGFYWE1TSVNqOUNObUFjejFzc0MzVDNLdGV4bGZETEE1?=
 =?utf-8?B?WTFzczh0aFVlMTZ3V1hMZkJmZzArMkplOXdib1ZNK2o1UGRLZng5THBranpm?=
 =?utf-8?Q?7vyjLinRDj5eGMx0JFcdNhsqEPTElXKp?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA1PR11MB7198.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?czZqR0xBdkY0dDRvV1ViZjh6bGdRcXFPQmRXOWUxSE9wLy9CMytoNFlYbDNt?=
 =?utf-8?B?bXM3Tkd1QU5lOEw4NzNRSzQxSjJ0QzgxbVNiUXB4TmE5Q0VVQ3E4bXM0a2cx?=
 =?utf-8?B?RzdkTzVWdk9CQUVVR1cydGw2TDFvc01jQUw2MENLM0FJS0I1T1MrNDlNa3lt?=
 =?utf-8?B?cWFTemVhN1BEcTlPQ0l6MHdVSk9KZ3FSaTB0WkVuYmUyVU9objI0UDdoR0t3?=
 =?utf-8?B?SmVTbkNCbDErMjhDQVdacnF4S2hzUDFRY0owQS9YNzlpeFcwbk95ZXN3bDli?=
 =?utf-8?B?R2cycGVHVmc3dWpnNEFxNW10SlZJbmZqZFRpWTBZTmo3NldVNDhDTDcxK0U2?=
 =?utf-8?B?ZUw3SGhsaGFydFVKUzFYUTU5Rk4xZHgyTXZDVlB5ckNxMUJ1WWxQemlIMWN3?=
 =?utf-8?B?b3RZVzNlQm1pdUE5Z3l0bTR5VCtmSW9pK2ppaUV6MTJMSTBodXhHdVZFd3JW?=
 =?utf-8?B?eTFoVHZPcmNTai96TlA1TE5ON3BBV3MwekpYOG9Tamc3K3hMSWpOUkJIeDJ4?=
 =?utf-8?B?aFdiQUpIR0JQVEN0QUYrcHVISElxSG41b3U1TkNjSVg2TlRWVGhjS25aK011?=
 =?utf-8?B?SE5DWVVFeUMxL01WNEZmQUZXb2xTeTFiZmp3SFRYWkh3VDR1eE1zcld3YmFp?=
 =?utf-8?B?YTJnVWRjcVNzcmlCOE1mUTZrTHBXK0QyV2x6OWt5cE40bjk3VWMwbzJxM1B0?=
 =?utf-8?B?WnNJT0VaOWowOFVTY2NoTVRabWtvRHZNZW52YmZqRnJRN2ErOUYzRjZ2Zy9r?=
 =?utf-8?B?WjRZdnpUa1VDNUxUZnZjZElMM0NVdTJKbVAyN1NjeWhJMHp2MkVObndwS0pw?=
 =?utf-8?B?a0IzYnZEMjNwZTJpQlZVcklmVUVWd056NjlzM051TzAreDRoeUJTMHhlZi9M?=
 =?utf-8?B?TUZUSDgvazU1QS9YMFE4L0JpdmwvZFJCUlduM2FLTmc3bVMreUNZRWdOdlhL?=
 =?utf-8?B?ZS9hTzlWRlRCTjlvWlNidS9WK1FUUXVsaWhsZktickMzaHUvNlZGQ2MzeWhj?=
 =?utf-8?B?ZS81QnJkd2pKNzF3ZElVU2hrRDJOalFKd3hkcWl2UFZTZm1BaTVQbVhOR3VI?=
 =?utf-8?B?OEtTKzAyeHEvN3pCdEd5dGxmaXdxK3dsd05xNVNUUVlHZ1lMRnRuckpIMC9Q?=
 =?utf-8?B?aTdrTDRJZFVWNXZqQ3Yra3JDb1pPRzRwa3cxRTYyZ1VvdUZ2Sk03OU5lTm9R?=
 =?utf-8?B?azJxbkV2dld2bUNaaGIxNmpzUktUVVdFQ3JKd1hYL0pzRVJPaGp2QW9hSlRr?=
 =?utf-8?B?clZ2a3BCL2JZS3BoWHZDSUJxM0lSSTYzS09zU3U2ZFA0dEZJYkRqTjFWcUZP?=
 =?utf-8?B?Qm1ZKzJwcUhxckx1WVR2N24wYUNDaFFURGFyNU5jdXdZbnpCQU1zUm9lN0c5?=
 =?utf-8?B?aU5kRkVmY28wSERmOGZ5KzMvMzY3L2MzTm5HYVRjclkvTmdxMVJyWnpzVjYz?=
 =?utf-8?B?R1h3RTI3VWY4TXJleU85clB3U0g4alBBbDJUNGF3d05aNUsrdnAyNlo4anNz?=
 =?utf-8?B?enBZNm14ZGgwSUFmczV5S05zUEZrQ0FFQVRpUGMwU1hodEM0YVR0TWZOZXJl?=
 =?utf-8?B?M2d5eFBwOTlLRTBURTVrMzRHWWgvTHcxVFgzZnpkWkwwRTlYZWhDd2RuNWlU?=
 =?utf-8?B?Nm45cWE4NEFaNUlIbEQ4c241Y0pmWGc1bjdzZXpMYS9nVHRQcmlxUUlxNkZz?=
 =?utf-8?B?VUV1VUtvMUYyZGU1Sk1TYkpRODlLdlN3QVVNaFlTZysyV2FxWlByWlVOMkh5?=
 =?utf-8?B?Nm1qSFF6Z3ArSEtjN0JjQTJlVUVrcGFQQ2NKeGV2WEdYQ2JtczV0T0VTWk80?=
 =?utf-8?B?OWhmK2pSbzNMTHA2NlVKK1VxeXZRUkhYMFZGZFZWWGZBRUY1ajRBL2lFY3A3?=
 =?utf-8?B?RDR6YkZrMCs4QjVDRjZxVEVlanRaTWxSZXovalJOeXBPeGtweVkwWGRiVWx4?=
 =?utf-8?B?emJWU1Jhek1jdWFHeGl1NzV0RzBBNGdwOHQ2OHE5d05ranplUlRtUkZ2VlE1?=
 =?utf-8?B?bVBSbGJVUm13czJxZnRTS3pybTMveXJYZmYvYnJEMi9yN1lCTkR3QVJMWk5P?=
 =?utf-8?B?MXNYQktiTTlESUh0a2NhRmJwcEhJOUx6TTluSkV1TVcxWjhZZjEvdlNpemUw?=
 =?utf-8?B?bVhyK0Zha09pKzZTR0JXRE0xcDRZMXdCNEhsWDJSK2c4ak5XMnJ6SWtjeEFy?=
 =?utf-8?B?WlZHRlRUTmRsT0ppVkE4QWNoWW1YUGRjWk1WWWlQTzFKWE12VFdBTGl0QzNY?=
 =?utf-8?B?R0x0WUV3QmozeXhlVHgxZ01ka2luUVZyaDI2S3V0bmMzOSs2aE5VQzgweTQv?=
 =?utf-8?B?NmVoYjFGdXdNanB0NGtPNlp4TVMwLzhSTEJQcnMyK3psLzBCdmNydz09?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9995d8aa-8f4d-4b36-418f-08de51b6317e
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB7198.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jan 2026 08:40:09.1559
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XpUFSchKIrh2yI78MGGG9pJvwMHZMwin6ZsfkoKN2LPiDsGUR9yUep5nBrVDjkea+56vIZfnTDY4qs/hIPXKKw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6748
X-OriginatorOrg: intel.com

On 09/01/2026 18:41, Brian Masney wrote:
> Use the linux/platform_data/pic32.h include instead of
> asm/mach-pic32/pic32.h so that the asm variant can be dropped. This
> is in preparation for allowing some drivers to be compiled on other
> architectures with COMPILE_TEST enabled.
> 
> Signed-off-by: Brian Masney <bmasney@redhat.com>

Seemed to compile on x86 with COMPILE_TEST, so please also add
COMPILE_TEST for sdhci-pic32.

> 
> ---
> To: Adrian Hunter <adrian.hunter@intel.com>
> To: Ulf Hansson <ulf.hansson@linaro.org>
> Cc: linux-mmc@vger.kernel.org
> Cc: linux-kernel@vger.kernel.org
> ---
>  drivers/mmc/host/sdhci-pic32.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/mmc/host/sdhci-pic32.c b/drivers/mmc/host/sdhci-pic32.c
> index 7ddac0befed87e6e46acfa7593203a5b540558bf..2cc632e91fe454bf29c1da22e45135d5d0267f54 100644
> --- a/drivers/mmc/host/sdhci-pic32.c
> +++ b/drivers/mmc/host/sdhci-pic32.c
> @@ -18,6 +18,7 @@
>  #include <linux/interrupt.h>
>  #include <linux/irq.h>
>  #include <linux/of.h>
> +#include <linux/platform_data/sdhci-pic32.h>
>  #include <linux/platform_device.h>
>  #include <linux/pm.h>
>  #include <linux/slab.h>
> @@ -25,7 +26,6 @@
>  #include <linux/io.h>
>  #include "sdhci.h"
>  #include "sdhci-pltfm.h"
> -#include <linux/platform_data/sdhci-pic32.h>
>  
>  #define SDH_SHARED_BUS_CTRL		0x000000E0
>  #define SDH_SHARED_BUS_NR_CLK_PINS_MASK	0x7
> 


