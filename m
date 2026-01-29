Return-Path: <linux-mips+bounces-13047-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YKgcEpTle2n8JAIAu9opvQ
	(envelope-from <linux-mips+bounces-13047-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Thu, 29 Jan 2026 23:56:20 +0100
X-Original-To: lists+linux-mips@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id A0299B58CE
	for <lists+linux-mips@lfdr.de>; Thu, 29 Jan 2026 23:56:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 658F030137AE
	for <lists+linux-mips@lfdr.de>; Thu, 29 Jan 2026 22:56:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9E4B736C0BB;
	Thu, 29 Jan 2026 22:56:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nWvl1REc"
X-Original-To: linux-mips@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C99542D46B3;
	Thu, 29 Jan 2026 22:56:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769727377; cv=fail; b=OsFV29oT5rCxGJIHundCTYknZCGWhcl3qZtg841b+QqGHLYqTg9qktY8ZOiRzu7kRkhG9HqKr5OcG5ad4xfAY1TQRBuRn1ESCWAXLERH6InRKO5jZLXPKuNmp5ZBfBVhZziTD9KMdMW7/fnkwStfXARPCghNy8YdqDfwp3yYTwg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769727377; c=relaxed/simple;
	bh=UzhxzI771WPipifNHBaRVDBrsNMPs2q/v3kpZkRnIaU=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=kvIIjKgAEa8YU7miL95iqe9A0Kh7pdblVsYj0z9++oXJ+0ZnOa2L9/5XcAbbiIQ6P24up4GzwFk5Ds4/lHiDaWbJV8tddCmxQ8cOvOExAuzQCuUz7zU+QliaJzI5hj8V+wK4r6qwuO7g13sOv4qCLnAgX8sbaeotToe40EiVBlw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nWvl1REc; arc=fail smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769727376; x=1801263376;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=UzhxzI771WPipifNHBaRVDBrsNMPs2q/v3kpZkRnIaU=;
  b=nWvl1REcwlsyPyYkCUlF23ylzZBK1bY3ut7OL3+bmNxYa1kdfCKFPLsF
   QbZWYfQ0xYuwq8nrNWVyH1zpnaAMrX065/G83zTgE0Psj8S71BBLU09iM
   N8lIcnuQN8RR3Z4sDh38T9G2/AXwuE3GwH4DaHU0U5L3dV18QmadldQBO
   1kxEzxkmyGHlbWQkDsG2cNMnbA7vo/4qPdVxC9e4zC15CNQEr32f0FiCS
   SDZVG34JiyDZyPJ0GD0jSF7DwuwXQUnM22UVgc7uplmGdHgbqVDrf6Lxz
   6zg2L026oiLurRLXH0HlmrVkxzBAavfQOFbxDh7rCdyRpnbMov4FnI+bI
   w==;
X-CSE-ConnectionGUID: OcQib7/RQl2J8zZC6vnFzw==
X-CSE-MsgGUID: cqisEePiR4GFn7UGvgNa/Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11686"; a="82408060"
X-IronPort-AV: E=Sophos;i="6.21,261,1763452800"; 
   d="scan'208";a="82408060"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jan 2026 14:56:15 -0800
X-CSE-ConnectionGUID: A/+K7FKlSvaiwzXJwgdwxA==
X-CSE-MsgGUID: 01XpGIclR3eXe2OkCwZOIQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,261,1763452800"; 
   d="scan'208";a="209122454"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
  by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jan 2026 14:56:15 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Thu, 29 Jan 2026 14:56:14 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Thu, 29 Jan 2026 14:56:14 -0800
Received: from BN1PR04CU002.outbound.protection.outlook.com (52.101.56.42) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Thu, 29 Jan 2026 14:56:14 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IpYEP/qc/MokftNTasKaF2JpT2YR6+ddq4ZcAA2Ifef62SwLTDbNHJJ51DOgE3b+jF/LciqAmeSkgZ11tzkD3nLxEzeWtW3km+jX9HEgBYd6/GDtQ/W3XlV6swAtKHOatcMVvyl4xJRuFO1RU3PbNT/NPo/gzKzJ8ny86xkuuJcrSTdszMI3CYVOeTTG9iAlYgTuLS1EueKXUyAPOWN5u5AQXLuVMj/il8RhWcDrDh++t/9cMacq23zYRKxurTwSJ3LPrEp0VrrDjQhlIJZzE4u3eq/8O72gQ0KKecJZ10GD/KWgHLhjplJdeEiS9ns7LsAO/fodHZLlMjXsQ2uLGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RxH/AvfuSQI9Z0kJwD2RlWlWtaYeSwVN1J+NUIdMfnc=;
 b=uSpC9+Pqu5SE+tvs4N5ODadFfMdrbF0M6P04Mmgh8PE1L+doXixtc3l2ylvNsvzawgmlUbe6o7S7tVwp6jZhRcZagVuaLyip9rGJOnNN6AK4fbgLbpUdcSuIuBXQ2CC5hE8WlYlBph2B+Li7H7Ny5rVtI2qWHk4pQ4URD1yAKQ2OCnKDAWlnk+22t/sjK2NQwA5gVweshEd+D5U3p95tYMqkhIXHvfDyE5bC8HP/TUhuvA1JMK6RvzvzpBOmREgJBvox8U2xAb+2hfcmnMMNzTWktO8WlU8kl6l2HjAH+gipYh5Z/cqFkwkMflI+xjAeLeMxGor0PAm6bWTlqnlHpg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CO1PR11MB5089.namprd11.prod.outlook.com (2603:10b6:303:9b::16)
 by DM4PR11MB6405.namprd11.prod.outlook.com (2603:10b6:8:b5::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.10; Thu, 29 Jan
 2026 22:56:11 +0000
Received: from CO1PR11MB5089.namprd11.prod.outlook.com
 ([fe80::81f7:c6c0:ca43:11c3]) by CO1PR11MB5089.namprd11.prod.outlook.com
 ([fe80::81f7:c6c0:ca43:11c3%3]) with mapi id 15.20.9542.010; Thu, 29 Jan 2026
 22:56:11 +0000
Message-ID: <395bfe98-146c-4da3-9c2f-362f548da59f@intel.com>
Date: Thu, 29 Jan 2026 14:56:10 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next] net: lantiq_etop: remove driver
To: Heiner Kallweit <hkallweit1@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>, David Miller <davem@davemloft.net>, "Eric
 Dumazet" <edumazet@google.com>, Simon Horman <horms@kernel.org>, Andrew Lunn
	<andrew+netdev@lunn.ch>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Vadim Fedorenko <vadim.fedorenko@linux.dev>, Lorenzo Bianconi
	<lorenzo@kernel.org>, Hauke Mehrtens <hauke@hauke-m.de>
CC: "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
	"linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>, "OpenWrt
 Development List" <openwrt-devel@lists.openwrt.org>, Daniel Golle
	<daniel@makrotopia.org>
References: <7b2b53b6-d230-47bb-98d9-b7acfbfdd8ca@gmail.com>
Content-Language: en-US
From: Jacob Keller <jacob.e.keller@intel.com>
In-Reply-To: <7b2b53b6-d230-47bb-98d9-b7acfbfdd8ca@gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4PR04CA0151.namprd04.prod.outlook.com
 (2603:10b6:303:85::6) To CO1PR11MB5089.namprd11.prod.outlook.com
 (2603:10b6:303:9b::16)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR11MB5089:EE_|DM4PR11MB6405:EE_
X-MS-Office365-Filtering-Correlation-Id: c7cb4be5-3579-4194-533f-08de5f8998a5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|366016|1800799024|376014|921020|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?N0Rwb2Q3a2FEZ3pWQkVHOUFiRjFjWWF2Qm45emhtdG9CQ2p1U0Zwd3ZQcnFI?=
 =?utf-8?B?dllWRzhxZ0JtbmFEMWthanJVYzhxeUdiWDBBdnV6VHZ3azJvUXh6eDlxSGFi?=
 =?utf-8?B?YVAwbldmY2VqSUhMNjZHbVBCdmhPVFhhZjY2TWZtT3V6dllTWUdxZERVRzdx?=
 =?utf-8?B?WG1TZE5WVjBOenBnNFd0a2V5YkhtUlRVYkt2VXE4TERzN3hzZ3Y1VUU4dVBG?=
 =?utf-8?B?M3UzVVZBbjNEVnNxOHN2T3lWRWdFOTVtRmdGME9mS1ZGOVFaRkFXYXNTcnI1?=
 =?utf-8?B?Zy83c3QyTXhTZ3YyZjkwRGt4Y3FhSXlYbU5kRGg4TWFta0E2UjgyQ3BwUUR6?=
 =?utf-8?B?UGFuR2pUY3BUNnpWRm1xLzM1MXJ4elJ1cGFOQ3FKTVR3clhLaGtmNUhrMHNq?=
 =?utf-8?B?M21SMis0VmtPSnVFc0V1R3M1ZmQ1cG9tQ2ExL2tIZkY4NXJ1NkRiTE1XTGo3?=
 =?utf-8?B?am91VitCNDluUUVkQmxjQzJyQWhKdmE2M2VydjcvcHRlTTV4YlFRWGc0cDI1?=
 =?utf-8?B?TlN0V21XamkzVXRGdmt2RFRoZ2VSdnFKVXcxY0t1RGc1VGZFU2RYcnQ5dGpM?=
 =?utf-8?B?TTBIMFE4VTFGZTlmeHZyQWdac2R2MzlZUlFTdEJMc2lObFlQZnJhRFJERy9N?=
 =?utf-8?B?dWVrVWRHK1VSZ3FQVE9GQ0lEOXdTRDhqRlFyeGZkSVhDRkZCRmRHMWo4aHFX?=
 =?utf-8?B?Y05HbkJoaE52M3duTHZnMmIwNVMreGUyMjA1SmwwZTBUTE9ZdTA2SWRFTlNv?=
 =?utf-8?B?UHl4cWs3ZUZaK3ZmR3dvUGNsbTNpdE5JZmZMWWlaWUlYcnpyTUVDTDdXajRv?=
 =?utf-8?B?VzdTSVRiQTZlTEdzVHEzbnQyOC9QbFNibEtna3gyNTFnWHliMGxpY1Uwby94?=
 =?utf-8?B?SkJybmtQVGc2VEY2SmpGOUJvQW05T3pHaFJ0N1pFVGJZd29UWXdQdlNhbjRo?=
 =?utf-8?B?bnZEZ1VTamVybDVpYnN0eEIrQXE2Q3JwOEFTT09ReVNid2Q2a2NGV2pDbE5J?=
 =?utf-8?B?aERVZFc1c0treTh0SU5EQVlhRFJXeC8rYS80dkFhV0tQdjdwV3h0citVVVJB?=
 =?utf-8?B?UXpNb2FaUTVHaXllbnhhaDNLTmg1Q1VzVmFOUjQ0aC9Cc3ZRUUovWlVEaXNB?=
 =?utf-8?B?NTFUT2N0dHhHSEsrZW9iUVVqUnh3bVgzSzE2V0pqNzdUM3ZhM1g3MmlJbUtt?=
 =?utf-8?B?M0tmQXY5KzZ3ZUJWRm9QVnNmelQvWWgrMW5PZWRBa3BQZTBpNmJ3YWgxK0R3?=
 =?utf-8?B?d3BUZWJ4dTRmSFpPdC9MMmFucWtDd0FXOE5WNGFqZDk4NENrVUtlUmh5MkZ2?=
 =?utf-8?B?UkZDbmt1NGM0VlFKOFovN0NlcjZIbWk2UWZIaXdlakd3T3NYc0ZEeXkzL2kw?=
 =?utf-8?B?anhCYVplbk12Znc5ODA3L09nZC8xU2NHbWF4ZEhQbWd5SHRNTHFJMlpiUkU2?=
 =?utf-8?B?eHBoTTJPZ3lKYVlNc1JJUUtTdmpsYk5XSUpyOTBFRmxIcmsvSXpWSTc3YVd6?=
 =?utf-8?B?dUt5aUxkOHZZbnVKSU9rcXlvWkhDY1VWUUxDcXFRZWY2b2prS0VvekJ0V00z?=
 =?utf-8?B?UitEQytabHkwd2lnWWlYbzNJbmpSQ0FSbHZicTFLcjFFVkhZcHgzV2NrQTBj?=
 =?utf-8?B?RGhUWUcwUFMyRWtvYlBZb0RCZkdWQ2lOMU5mSVZEaXRrSnJHSjh5N2Y2OEhw?=
 =?utf-8?B?dTgwSVk3UkNRK1k2aGNIMUZRVWJqT1BOcEloTGk2SlZNZlovZjRpMHpINzRH?=
 =?utf-8?B?aHp3alZVVlJTYkFqYnFyZWwvNnU4a0NpbG5sdFBmcWZnbU1jUGJhVkxONjVm?=
 =?utf-8?B?MmNweUR1ckE2QUMrRS9lYVFRQzIzV0hneVQ4WDgzbUh3Zm9KakM5TkVuRHU5?=
 =?utf-8?B?VVd6RHpUQnQzOEdjTmVJbkVrOWJPWjhYV2ZGNmZwQVNDb01WVkhjenlYZkZq?=
 =?utf-8?B?TGFjZHd1R0hIQVE0NDRsYmNTSFhLSkdxM3pFQXVxUXdqbHJseiswYWdNYndk?=
 =?utf-8?B?VkhyNnNROWdzRWNQNG5GbmpHT1Z1VFlya2VHL3lzWDlSWmV1N1JId2hMWCt0?=
 =?utf-8?B?RllMSlR2VVJZeTlzYS84TytBbXNhSG5WemxmS3V1RUtCS0FFSy9rV2V0N0FO?=
 =?utf-8?Q?G0Hw=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB5089.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(366016)(1800799024)(376014)(921020)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eEJ4NUZvUUE5Z1FtejVncldzSDFVUEt3MzRkemE3a1JkZVowN3FOclVBb1c0?=
 =?utf-8?B?THQ5dmdxT2k0c3ZLRnV6SkozdTI4M2l2ZlVsWnlqQjVaZW5sSXZHSVpEb1pK?=
 =?utf-8?B?eUtuTHZvRWR1Y24wNnVucHdZK0JxSjBMU0pnZFcvN2hYSE16cld6TndYQTRG?=
 =?utf-8?B?eUpleHkrOE5yT0JSOHBYckFyTW1KUU5ndU5OcHd1bFdUQ05lMHExR01uVHdE?=
 =?utf-8?B?Tk11L2VoWElSZi9vc3lTNkdiMkR0bFZVazRpbVdDZXJzbHhHMTB6bkhhQ0Qx?=
 =?utf-8?B?emo3QWN4cTl0MFJKVXVaemVDeElhR1dRbVExOTdQemFWSklVQjRYMW5kYVVP?=
 =?utf-8?B?eU9uN3JORDErdjhlYzJ6YWk5SVBvOHFwcmRZSnk0bENlRkNuRW1QRCtoN0FG?=
 =?utf-8?B?ZXo3b3I1L09EdmkrQXpuclNldjJzTXNqTTBXSlgzU0RsMUx3UEpTdGl2dTgw?=
 =?utf-8?B?MzJwRWN4MytMVGptd1RLeEt3eEtvYXRNSkFybmI2K3Z1M3hhMkdJYXgvLzRi?=
 =?utf-8?B?ZEFXSjJaQWY1RzFwMThrajZwNEIwOGdjV1QrcFlUVmx2NkIrZVRGeURjSnNu?=
 =?utf-8?B?N290Y1dsdHcydFlONGRHcU03VUZFZDE1blhZcTJTOWRzVm1EUjNuWXF6N0tv?=
 =?utf-8?B?cVRZS01yRGZXU21BVEUzU0xCWXpveDMyRTVSRzFScnlRVUxYZXhGczE5RnRK?=
 =?utf-8?B?QWtKMG45ckl3WWFmNHIxVitYQk93NHdxNStBUjRUYWRmeFlUSzZFeWsrV1Mz?=
 =?utf-8?B?Zy9HUDFwV1dwYVVZb05WamtjeHlGUmZvUEFrbVU2bExxeE14ZUtsZ016dWFn?=
 =?utf-8?B?TklzeTRmSXZWMHMwOE04WFBJa2xkUVBYTHJESThUOUpMNnpPYThuYVBkTkVy?=
 =?utf-8?B?c2F4VWJaUmYxbTJHZXVMNmhsa1N6TmJHaURZRmk2UnEwT0JJWEJuNkI3M0w3?=
 =?utf-8?B?WGcvcmordThrSDhmc09BeHJaUmR5SnozR1NQZzlxaVBQMWpyN2gvaDNoUFkv?=
 =?utf-8?B?UjJVdXdhd3VMUks4ZCt6eE12emNtTENvKzVTMW1IRHh0cmlZalBsZWV3YVND?=
 =?utf-8?B?R2Y0c1lmR1FuQ1pjTXdkNUlUQjRFYytvL04zbVJpai9lZUExZmdZaHUrYXFr?=
 =?utf-8?B?SElLREppTlBrMXpEZUxIZUNqVWV0UjJ6ZllRWis3dnY3Vzc0ckg2MnNFd1Z1?=
 =?utf-8?B?QUZzZDNoTlBsalpUc2h3L2xUSUM0QmV1WkhFaENCTHQ0RE1wL3ZrNVpiOFBM?=
 =?utf-8?B?a0g5bnpxdlNBeVZkYlYwZ3N0QkVScmh4NzZ1M0toNUxvNmtXamVTTnRpZTV3?=
 =?utf-8?B?MGRsR3pVU01jMVN6TDNUcXV6djQ5Z3hvd0s1T0dZOC9WR2lyTTAxVVpuYzM3?=
 =?utf-8?B?b1lWa21qSjRyZ3Y0K1lVUlAweDVoMzNaNmdlK1g1RUtYenpjRW5aUmRqOTVo?=
 =?utf-8?B?TVhxWGtsUUZqK0FJcU9LZU9lbk9QdnArdHNBRVF1MkhDbkRoMmx6M3ZBN3E0?=
 =?utf-8?B?dE5BUkVzQm1YUnR3bWx4azBLT015U0t6cFRnekV0UDNpenhZT1RSNlhUTmdq?=
 =?utf-8?B?Q2xKdG1FV2RkNk1xakpUdmkvYWNNa3ZxZnA0MlhWK1BJQXBVb3lEaHd2MXp3?=
 =?utf-8?B?d0hkd0xrWXlDTkJRWE5Pb0R1UDcwb01WV0oyZjBSaEU1KzFwZTYwaDBTQXBu?=
 =?utf-8?B?RnAyUUxRVjVMZ2tLK1pLYlZ5NXd4dTNQOTVFejNLQ1luU2JvRUxmUXhMK1d0?=
 =?utf-8?B?Y01NVTVJUlRWTDJBYm0vazhiTHc0RXBLV3dNSTN6MHR4ZVlzRUpyeWZWeHRY?=
 =?utf-8?B?S2dVY2lrV3h6ZUtxYStNemRlbzh3cEJUbERUNUV1ckcwZjhuM3BHV2tTelc2?=
 =?utf-8?B?M1JSSzNvYVVFS1dWMklsbG1CWHAxZXcxaVdQSDc3YU1jRFhvTHFHR3dDY1Jo?=
 =?utf-8?B?dTRVRmt2eXpLZHpyaWpXenZUWndVSjZoWTFsSW1kVldLZ2VTekpMVE1kWThk?=
 =?utf-8?B?ME9ieWx0TENadVJ4Qi82M0N1SVJKbzRaZlRQbkVCQjZNT2ovNHRSdEdvUnl0?=
 =?utf-8?B?cFVmRllyMjlNRWpKc2gyZEJuU0xiL3gzV1lvUXFpekFBalNMK1RVY1dOTGha?=
 =?utf-8?B?d05kajRRT3FOOHpkWDlPMlU4RnFYNGphbkw1VjJFYmRNbEpNMkQxaWtkRjBK?=
 =?utf-8?B?VG1IY3BnVU5tSHUyWndqWG1FUTloRnpBNDk4MGZyWHd0UFJjODFDVEZvVTZw?=
 =?utf-8?B?dUlYb1lsQkovd0NCZThTamFuNzhtZGpWOUg5V3EzOVJXSDZsSFAxMENocjlY?=
 =?utf-8?B?UEw3TlN6NDFVdnZ2Q29wZnhHZmFpMGdyMzZkWVRIOWNEQVM1Y2toUGxsalQ3?=
 =?utf-8?Q?4oZBRb9rak4SMTG8=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c7cb4be5-3579-4194-533f-08de5f8998a5
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5089.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jan 2026 22:56:11.4158
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HCVcSpFImL4x5h6EgQHHO0EkH4idEKkP7w6XQb3gmvJlDnQOrtxmGwUX7DLexr0GAuxJQJTon0AtYJR1r+9SuosTtWwaoJ5P6iTNicDWT0A=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6405
X-OriginatorOrg: intel.com
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[15];
	TAGGED_FROM(0.00)[bounces-13047-lists,linux-mips=lfdr.de];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org,redhat.com,davemloft.net,google.com,lunn.ch,alpha.franken.de,linux.dev,hauke-m.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:email,intel.com:dkim,intel.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jacob.e.keller@intel.com,linux-mips@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-mips,netdev];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: A0299B58CE
X-Rspamd-Action: no action



On 1/29/2026 9:18 AM, Heiner Kallweit wrote:
> This driver in mainline lost its in-tree user with commit cd93b4895ea5
> ("MIPS: lantiq: drop mips_machine support") in 2012. Since then it has
> had no in-tree user. Only user seems to be OpenWRT, with several changes
> to the in-tree driver version:
> target/linux/lantiq/patches-6.12/035-owrt-lantiq-wifi-and-ethernet-eeprom-handling.patch
> target/linux/lantiq/patches-6.12/028-NET-lantiq-various-etop-fixes.patch
> target/linux/lantiq/patches-6.12/701-NET-lantiq-etop-of-mido.patch
> So it seems the driver is maintained in OpenWrt only, except tree-wide
> in-tree changes. According to OpenWRT maintainers it would be ok to
> remove the driver in mainline and keep it downstream only (see linked
> conversation).
> 
> Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
> Link: https://lore.kernel.org/netdev/d80fef86-ba14-4bd4-bce5-4d61a75d591b@hauke-m.de/T/#t
> --- 
Makes sense.

Reviewed-by: Jacob Keller <jacob.e.keller@intel.com>

