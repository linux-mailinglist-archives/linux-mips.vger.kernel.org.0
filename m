Return-Path: <linux-mips+bounces-9682-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D471AFDCBC
	for <lists+linux-mips@lfdr.de>; Wed,  9 Jul 2025 03:05:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 176617AF418
	for <lists+linux-mips@lfdr.de>; Wed,  9 Jul 2025 01:03:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 39B1586352;
	Wed,  9 Jul 2025 01:04:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fgVqK03m"
X-Original-To: linux-mips@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D50422F01;
	Wed,  9 Jul 2025 01:04:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.16
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752023098; cv=fail; b=jVMG9/bNd0GldYONhmWGvf/AXw6MXjmPvgt+1qt/zUV7PQ1HrFhIACtAwRJmA/J0zA+D1I6/QX4VS3hLMPR5XVfeWCQqKEetkm1ZKZQ/7X2x4EF39Pjzn1V/j5j41LsZx9iPnI7eX+C25w/HwKQcnwB7Zd85B0x4IPZmMQC0x50=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752023098; c=relaxed/simple;
	bh=rsQm4rnTVNAYT3IBlXXNHhMWfKd+D3t4LQ8w4XN8epg=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=t0K0kD+syNTv3KqvYyq3cJIChhvNBj0J9rjg/H6c52nwj02qAcjdL5rtVAcmTGD01bSr8EemLSKPGxAk57pit6MiDR142Tho6qq/wrzRBgP0bQ9B+xFCx/qADK1PzX37EgpGLFDMrnfmaEyNVcZ5yd0Z8HPlYppB7x5ZOfewYUA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fgVqK03m; arc=fail smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1752023096; x=1783559096;
  h=date:from:to:cc:subject:message-id:in-reply-to:
   mime-version;
  bh=rsQm4rnTVNAYT3IBlXXNHhMWfKd+D3t4LQ8w4XN8epg=;
  b=fgVqK03mdUjXRhNDopU2+FLUnINxi6n84tna8J4aS6XMKn3rUAAnvg7Z
   rnSfsvqv9EJPJ4mDYJqN+7fkX2zF4SaKDRYQ9qDwqMmvLK+STGDbhqJQD
   pMEElmW6UzHoQB9hYJRDzPHHHIX8eu61HyzoGp8aoEr2xnuJkZb5E4rtJ
   7avmtNGjK/A5dOLM7NJoGM5eeGvM09IXB/1NKLujChCuRTJwf69kd7OMb
   cQE6VEeTfRiX3sCEOueU38/+lC51iyC2JIJ6Hs6FkIOjEGYhexDbCKiIZ
   fu4gIdAkfMYqlaJGZ0+b2hIGHtVinX44U+lBYZpfYqfjekfWUH1Nltznb
   w==;
X-CSE-ConnectionGUID: wfYU19yFQdOrEOstNxBkpA==
X-CSE-MsgGUID: D1R3yS2pRF+aOzD2AHBv0Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11487"; a="54403964"
X-IronPort-AV: E=Sophos;i="6.16,298,1744095600"; 
   d="gz'50?scan'50,208,50";a="54403964"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jul 2025 18:04:53 -0700
X-CSE-ConnectionGUID: cfufoS7ySRWpEa2usByp5g==
X-CSE-MsgGUID: szVvWyBqS7eqL5u2fEVr0A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,298,1744095600"; 
   d="gz'50?scan'50,208,50";a="186602948"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
  by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jul 2025 18:04:52 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Tue, 8 Jul 2025 18:04:51 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Tue, 8 Jul 2025 18:04:51 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (40.107.220.74)
 by edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Tue, 8 Jul 2025 18:04:51 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oHExqMmjyPprF7/x+3J0BbvCODE8GZJGZMKQL/CFlKbATx9RtKQSQeYnpJqipgXehGBvmfowGRYxh7mKh72Me/Y3spMsXiZ9wDkICNGlfm4DhTfYrKKQswd5M6AflQ0pKIdJlR45ZA6+V5+ycqohM9YdQznZPwwsNv8XnKiIfWmme/0b+/pWlmZ7+A/CkLThRNTVFEXMZz5jOHf76GxEW/Nyq9lqnaJvdqebdfyJlZBw75ZFJ+htMuQOV14NmsaBKgvnpLsyuwsbgYSRNfN+i3LfLpfgblyMn9Ttoxs+Dmv4BNJuYiiEFmbErKK/VH7aXv575z1wc3IVmMD6T8wrLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GhHewpLWnhGHcAFWi40CRGfP55OQWwe0oIMJ9kztVXo=;
 b=ueYVMMpHiinw3ofMxUBIEA+i/ynsmFOPM8H7qHdzBIDvRiQc4HETJaoB/Ztf6qLhIvyGDY+2b97BocqNraxfhoIm6fev+kkcf4piZssWtPVqG2pcska/tAj19hXMCHkKSfNqe29XH2lJYCbqzaSd4BW2/8uDxbqUytFU6+9TLp4uxCY+XLnoZZ7IRCgQprMHPu6jptKPPN7DsNQLCNVFdTSfIqWhg7cOUSmAHS52zKSO5g9AQ3TCOfQCJ4lxSScF7rSS3psKw+fHR5ZaUrV8Et2UuG75cfS68bwSfpb3JMWK4VpDwnq8Ff+iT3+bXrcF98TxnrLCKGVNdrXqVcWNOA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH0PR11MB5674.namprd11.prod.outlook.com (2603:10b6:510:ec::10)
 by MW4PR11MB6911.namprd11.prod.outlook.com (2603:10b6:303:22d::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.34; Wed, 9 Jul
 2025 01:04:49 +0000
Received: from PH0PR11MB5674.namprd11.prod.outlook.com
 ([fe80::77d3:dfb2:3bd:e02a]) by PH0PR11MB5674.namprd11.prod.outlook.com
 ([fe80::77d3:dfb2:3bd:e02a%6]) with mapi id 15.20.8901.021; Wed, 9 Jul 2025
 01:04:48 +0000
Date: Wed, 9 Jul 2025 09:04:39 +0800
From: kernel test robot <lkp@intel.com>
To: Gregory CLEMENT <gregory.clement@bootlin.com>, Thomas Bogendoerfer
	<tsbogend@alpha.franken.de>
CC: <oe-kbuild-all@lists.linux.dev>, Jiaxun Yang <jiaxun.yang@flygoat.com>,
	Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>,
	=?iso-8859-1?Q?Th=E9o?= Lebrun <theo.lebrun@bootlin.com>, Tawfik Bayouk
	<tawfik.bayouk@mobileye.com>, Thomas Petazzoni
	<thomas.petazzoni@bootlin.com>, <linux-mips@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, Gregory CLEMENT <gregory.clement@bootlin.com>
Subject: Re: [PATCH v3 1/2] MIPS: CPS: Improve
 mips_cps_first_online_in_cluster()
Message-ID: <aG3AJ2XnH2JKOjzY@rli9-mobl>
Content-Type: multipart/mixed; boundary="n+92fEH5NwxfErLz"
Content-Disposition: inline
In-Reply-To: <20250708-smp_calib-v3-1-6dabf01a7d9f@bootlin.com>
X-ClientProxiedBy: SG2PR04CA0157.apcprd04.prod.outlook.com (2603:1096:4::19)
 To PH0PR11MB5674.namprd11.prod.outlook.com (2603:10b6:510:ec::10)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB5674:EE_|MW4PR11MB6911:EE_
X-MS-Office365-Filtering-Correlation-Id: c373a53c-c91d-4c24-9c5f-08ddbe8499f0
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|7416014|1800799024|4053099003;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?uiTxBQz9eFA8mrW95n1JiRrTMc2yKbbS7E+xEG0sfkEKaQyzzXOx559s9uuN?=
 =?us-ascii?Q?rypYgoDiACeiNZPITI3j9ZXpclrwzIdZR5c64TOZsoCF3d/Ky2iE0/b1H9nn?=
 =?us-ascii?Q?PBBTzAQtz2km6cMp6HnMG0Gx1O9+Aj3peSMDQqBcDqFdmAhruwlHvXP6tCSc?=
 =?us-ascii?Q?s+7KSWiILEfxq53pLDp0rLnTD0RLuiU/8c34qhqJ9P7n3NdGdWkpukdAgrZy?=
 =?us-ascii?Q?wGhgY7irdj2AZwdfQNhSNc1nOi6VuLQIjrjsho029aeAe4cMEgo0ZSXuVPVV?=
 =?us-ascii?Q?fSiDKpJQSYHc+GJs7ogBdVJmyuNPCH8RUMxpY7S584DqrnvLZdBsUcbrCjwg?=
 =?us-ascii?Q?TgBl7Puo/UnLKp7/LR+qZuEa2yGGtk8AbA3+oNEA27mKKfL98sl7XLfFU2DJ?=
 =?us-ascii?Q?VJ1NLrYMPdkMjjE31lxhQ+jNTFvdiiEW48STQpbX0o+QXxJ0fGz6N0rJClU8?=
 =?us-ascii?Q?ncwp30tol/X/P2XPs10dT42jiMc8UWcO9iT0/Zt/E6zssJJKCP4qR+REqkxM?=
 =?us-ascii?Q?uqbi5iLxcCD6MbIHSnfjmm1W1eSveRnuNrbV67wlmwvkOgG8Xh2GMOI2qgC0?=
 =?us-ascii?Q?sqKuqaYm8ic7K+YAYKnOXGnyzQeKd2FB4EsRyCccAXEW/BuC07HJoxGw8WOn?=
 =?us-ascii?Q?XBlEOSAzL9cb0qrvr2d91VuBb14YAg6veGytYVGNS7PKLLDl3odhSyOf5Cyw?=
 =?us-ascii?Q?7fZe9DSbTmLcVY2BN7Gge9AFdZOraFpfsjTpzg5TmwTedwYBFEMASAsVHPwn?=
 =?us-ascii?Q?f4LPQHzrIIymXTwiiDVPaJkG+d7YulyRIB5LYpyq0xPgfWJxLJmjHgFXE8AN?=
 =?us-ascii?Q?5JXEjpkKFUbuKq1A0jg9rto1fRLRbY2XGBmWpV5WHSpoFTYd1dVGkctSQnSD?=
 =?us-ascii?Q?MOUzJwICVLQs4hmDWY2lYf6VEx28IDDmPLTlYyA3wK1k7jaNL4LRYEhG4okk?=
 =?us-ascii?Q?cnipoEY6vzRi5gX6cW9zwvbIkgRNHYcu0Gq7Le2gOtgHZ5Fd8ZqXbAkQMFKf?=
 =?us-ascii?Q?xRDaiogRdPVBf9HrfO9It3SA6U5JpOtmdYpTPT/v6x7eWh/mBGMNEtutZi5Q?=
 =?us-ascii?Q?xXg80Sw5xhsO8ZnvYHarwh3LJ+Tx6discgGjNvgyv6z/JiXD5T841a9+U48r?=
 =?us-ascii?Q?u9v8i/R3OGAK4+lnF2dARh+ENgmXT0QtS65Xpf+dfmn6yPnW/KEfaTyLxd5b?=
 =?us-ascii?Q?t9leFCD8wicJxeRS5R56EYlvHgvblzAQ9aS9++DmIz0Eb5AGc4b0nPbUHSwQ?=
 =?us-ascii?Q?0fzad35Rl+GmjAHexhY8T3Bmm8tmh3HouDBjQo4yZKtiqMgjSFhUIil4+6QC?=
 =?us-ascii?Q?mcnSaK9gwqvgy3U8ysuP2/4K?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB5674.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(1800799024)(4053099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?L1GFlUmIbNhG6X/YVymKSdLGtQEdrjgPVY1Hj4jDAkOpuE+jEL1W3R55BB+t?=
 =?us-ascii?Q?hGc2sKqRYZGWHX+loT1QmospvZ6IULqAF/0hFHMzugupHs/4+KfUlKWdxsZD?=
 =?us-ascii?Q?QbvWSSmqu01lVNrDCCJ629hLt4jtEOIys+VmY259sH58DePVz/XuTtyKqcas?=
 =?us-ascii?Q?HOEr4lcVu0aHuk6Xqp5c4rkdMZfsVMmcqYglxLs7Dx63Z8w1igZ0WO2wMkHr?=
 =?us-ascii?Q?G5O5sXLInIKgU8NuOp3bvVZGpoP4zf98e3LcBGwaUsBOUreJDHPkb9ZptwL7?=
 =?us-ascii?Q?Ka8OMeWJR9EEWev2AyFelRcgqGt0YLL2xUf+vWElA7+1sLSnrAKlbZRDhVxS?=
 =?us-ascii?Q?M2tKUN+OrQTMNM8gBS+OGxb+sjL3YE2yqdICHwfybYEb1CIigmKuZzCJz46X?=
 =?us-ascii?Q?IehaIvD4ljiaUiPkKVTYtI474d+TJod5cPbzA/k5LqGMR2OvrIxDonC7/vOr?=
 =?us-ascii?Q?FnSlXhTaCHZFG9rQlIDk7dbMsMZu7F5aLgUlIwuM6OIIKubPL23KarhK4xJ9?=
 =?us-ascii?Q?8Xp9Al8o7Q/gNHOD2HZtfTEQoarvXyijBAZAFHSWYpCfa4SRV4H1QfBhZ4OC?=
 =?us-ascii?Q?1/kMGmP2mcX/KjD8l7hKrLjB6rnYBntRetom8SBr57ANAkYoyMhiGGm63ZSx?=
 =?us-ascii?Q?UJ3yLi6git5begko/+ANBQ0kTWwGsBWl06JWJQjvdBw6UTdYb1fdxeOdAK9j?=
 =?us-ascii?Q?wfZ4ImLhHEJempEYptQytKEQyuSL0C5Tys8D0rgHrnugTvdACQr1et1q5ZLp?=
 =?us-ascii?Q?FnabFCesXJhaTjPgs2V15b8r4j7TsxUf63LpvVYG3UBs7eKMjOfemOZORWPR?=
 =?us-ascii?Q?dmDh3DOjUP1nGv7ebGTwM2xwC1Tum97jA+WJtxqGafGnQZZoXhjKUVm4g4fE?=
 =?us-ascii?Q?N+qNxGmgBIEGHPw5fKzaf2eFF4EclXlpanMPAvdqtROygPXNih124f/bpjta?=
 =?us-ascii?Q?caTltpw67+oRlcK/+YHRikJHFXGcUU32LBExMmHUngmsXbl229SR9tPyH/8W?=
 =?us-ascii?Q?SaL0cI/RA5ZDTfuD0iyqe3M0dL8iWmY//suHYFk6KQpaf0D0b9L0ZdiuH+xB?=
 =?us-ascii?Q?3mgxbyTSEb2oPV4lfo/lT28eqb4KLupIfksy0/1NAhgkgHpdfosm/0OpE0PZ?=
 =?us-ascii?Q?0YOhXwFMEF2GtvxgJzlQrkNuGMP3/U5O657fhLujEJCRkKVfDzVQ00FYek9J?=
 =?us-ascii?Q?/vZGvUE1fzaSS/X1DIOLXEl0rzxeOqi/wM7TEnVFR7HpX6+26zlLKCGHK8Pz?=
 =?us-ascii?Q?dIL/PQpCmC9PcrVDy9MmzLnkHVmKWxG7UcG+okprZFRXM4LNwOGPt0Fl/qvY?=
 =?us-ascii?Q?i5cMnMipdMJWm0M1GFSg7YNsNC+oTXogqxirZcibC1u3wOnkubGzfOUCa8f4?=
 =?us-ascii?Q?N5CKUsFI1rSasaYkZSu5G1fgLxWf0jDfHdn3vIUBJpXT5L4Vw93iOtlh8hie?=
 =?us-ascii?Q?jq3NG35zdq5EaBYsd/RN/ah8Hvdx4BIxLDdSk5uR/0EjPLeqXdQy6yWV2/Bt?=
 =?us-ascii?Q?DLHyy38R+P5sTleB0sfdXMjI/1CxgSpY+Aet95H4rGjkyp9iEn3N5ltoKeaO?=
 =?us-ascii?Q?seswBz5m507IZqQlb+og59yeUlOqVm4sdcJffsKL?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c373a53c-c91d-4c24-9c5f-08ddbe8499f0
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5674.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jul 2025 01:04:48.8498
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: w5JqEhb63dCYvrBjTOPq7iljh4z884ztrNCzTp2B/tabO6ylMt9/WcPPdAdHMWGOnC5JdtH7GdCo0c++bbKJhg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB6911
X-OriginatorOrg: intel.com

--n+92fEH5NwxfErLz
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

Hi Gregory,

kernel test robot noticed the following build errors:

[auto build test ERROR on 86731a2a651e58953fc949573895f2fa6d456841]

url:    https://github.com/intel-lab-lkp/linux/commits/Gregory-CLEMENT/MIPS-CPS-Improve-mips_cps_first_online_in_cluster/20250708-214752
base:   86731a2a651e58953fc949573895f2fa6d456841
patch link:    https://lore.kernel.org/r/20250708-smp_calib-v3-1-6dabf01a7d9f%40bootlin.com
patch subject: [PATCH v3 1/2] MIPS: CPS: Improve mips_cps_first_online_in_cluster()
:::::: branch date: 11 hours ago
:::::: commit date: 11 hours ago
config: mips-allnoconfig (attached as .config)
compiler: mips-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (attached as reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507090815.zV5novvV-lkp@intel.com/

All errors (new ones prefixed by >>):

   mips-linux-ld: arch/mips/kernel/mips-cm.o: in function `mips_cps_first_online_in_cluster':
>> mips-cm.c:(.text+0x12b4): undefined reference to `mips_cps_cluster_bootcfg'
>> mips-linux-ld: mips-cm.c:(.text+0x12b8): undefined reference to `mips_cps_cluster_bootcfg'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

--n+92fEH5NwxfErLz
Content-Type: application/gzip
Content-Disposition: attachment; filename=".config.gz"
Content-Transfer-Encoding: base64

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

--n+92fEH5NwxfErLz
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: attachment; filename="reproduce"

reproduce (this is a W=1 build):
        git clone https://github.com/intel/lkp-tests.git ~/lkp-tests
        git checkout 86731a2a651e58953fc949573895f2fa6d456841
        b4 shazam https://lore.kernel.org/r/20250708-smp_calib-v3-1-6dabf01a7d9f@bootlin.com
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-15.1.0 ~/lkp-tests/kbuild/make.cross W=1 O=build_dir ARCH=mips olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-15.1.0 ~/lkp-tests/kbuild/make.cross W=1 O=build_dir ARCH=mips SHELL=/bin/bash

--n+92fEH5NwxfErLz--

