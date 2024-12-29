Return-Path: <linux-mips+bounces-7190-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D7C79FDD1E
	for <lists+linux-mips@lfdr.de>; Sun, 29 Dec 2024 03:24:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2A5DE161282
	for <lists+linux-mips@lfdr.de>; Sun, 29 Dec 2024 02:24:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 83FCB2594A6;
	Sun, 29 Dec 2024 02:24:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CcwvUswI"
X-Original-To: linux-mips@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D2B03C17;
	Sun, 29 Dec 2024 02:24:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.13
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735439055; cv=fail; b=UfNPH9aZDG9DyPQVzkpZF0MzZ1Xud0BT+h1dQ4S1o6LwaqGGo9Qwl4XovZRYkeyNtPN84kAMO3HJT+5gwySG7CL6iKr/0DJ020ycfW08cFb8FVUC7vsr1XA4L0D+eeXaQR7k6E6wZ1tIgS1j7gMSO/5aaW+bDtOjX8O5xqbVbLo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735439055; c=relaxed/simple;
	bh=GNHCnlYhmXSJCszs62K543mtfwFLZsLnuiKLF//tXBU=;
	h=Date:From:To:CC:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=jtfREXp+sAhFHdV7ZMNqUvtUf/w45aAmFqrm3he34/GC/M2V0uk48cshk2Hru02PPD71ThDC1DoJP4ODj647V9iPblS19KUKhkm1DSROXGlMJRfY2KgMMZ3T3N4ZZqWLpo0BbcrMnVRzNn+Js+BLLk1+SqfLIH8DL8B//b+Z5L0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CcwvUswI; arc=fail smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1735439052; x=1766975052;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=GNHCnlYhmXSJCszs62K543mtfwFLZsLnuiKLF//tXBU=;
  b=CcwvUswIDvBYLQbmqQXQ2bcdhPfMcnG6fypt1cuvNcoVoyHTS8+oYLQE
   QGoMfHC/9pp8mT642m0vUon6idL06KsDAGmlUBIFw/UOCS+IwNqe8MqS1
   PWZKbEsRBKT4k58lvl99KxlwUIA4cVafQSVBSKVjCguHF3H4wt3Lo4BKv
   PJiwEPS4eNxduH9Fm0IcD4UI9tWKDNLcf4tVt+8ZIduQKCJMSvSV3q76R
   Po97u4apThv4dylq87SQkeE4qE94a1DzwOrqy99zEhmzUO30/AHxQv2S5
   plhl2Uha54QHkPAXleEghhi7rluTx+Kk1sR+x7jC7VHyIwjAW/9Zglxhf
   Q==;
X-CSE-ConnectionGUID: Dvt2rsnjQkW8bY5bAkOWYQ==
X-CSE-MsgGUID: LpdndWyyQHucqVaF3eORKw==
X-IronPort-AV: E=McAfee;i="6700,10204,11299"; a="38613209"
X-IronPort-AV: E=Sophos;i="6.12,273,1728975600"; 
   d="scan'208";a="38613209"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Dec 2024 18:24:11 -0800
X-CSE-ConnectionGUID: T1j5NhqcRwSUp7UV294m/Q==
X-CSE-MsgGUID: VlE4+zD7QKyHFSRl/38Ltw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,273,1728975600"; 
   d="scan'208";a="100586807"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
  by orviesa006.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 28 Dec 2024 18:24:12 -0800
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Sat, 28 Dec 2024 18:24:11 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Sat, 28 Dec 2024 18:24:11 -0800
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.46) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Sat, 28 Dec 2024 18:24:10 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nXkMk704Rj8u7WsjA4YTJAPHlGJ3YPJWlvC9SPE7aiPL0yvyC5loMncbxkt02+OUZBzKxsXB43Uhhfgp5Vos8uRGEWOZe97GifFUlNNRDCQSw1Tliq0aW2S0hF8Rc6JvZMXz7VcupmPFSNWk4slbq8TmomiKB5xHPDYdUJoGipoEyI1osO0md6pKjSz66TF21yK625UcoCRAr5EBU97OlZx7GYhLp4jJBNSgKPUEqjxgOUlOLy1LYuzQkOKtS1QuqGm1UzNgMWi9t6bQlhfuy0YEpRVEGMJpTRJm3BVBmVQUMjwaKIa08k4vp46+ZJtzRMfEJNEY+mjJx4H6rLyKpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2dlY2s4l9IiE6K0pms89Ept7//aJ59PW8MyFgNMxlnI=;
 b=Emgp69ageZKthJ9byAIvjEsNmCI8nW8RvrUIjkis5/xGO4QzGR1NeQS2NdlIVbpl7SLBe1rfMCOkWdd0BDJnT+E9/X3smccqVdknr1jU+DSsVODZhrylOR8jD+qmwQVxa4ft197kuthLcZ97GH70t+h6ebIxJTnYKgQyRdI6vPsKISVVnNPiDjKq9maz8fdAz22HCSM4g+jeeLa5B4kOmxJjyTqX4Yi8dpDPG5xd4YYcUXcKMNlD+uIXEmwQ+pIUp/pbsWj8HIbYyAuxH9w+TOEmsNb8UAG2m9jXRk/qP6eEbUk0ZHKdqM16DKwHUPBfpfDN7sbyazZVx4rFLCbEIA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5423.namprd11.prod.outlook.com (2603:10b6:5:39b::20)
 by SA2PR11MB5097.namprd11.prod.outlook.com (2603:10b6:806:11a::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8293.17; Sun, 29 Dec
 2024 02:23:38 +0000
Received: from DM4PR11MB5423.namprd11.prod.outlook.com
 ([fe80::dffa:e0c8:dbf1:c82e]) by DM4PR11MB5423.namprd11.prod.outlook.com
 ([fe80::dffa:e0c8:dbf1:c82e%6]) with mapi id 15.20.8293.000; Sun, 29 Dec 2024
 02:23:37 +0000
Date: Sun, 29 Dec 2024 10:23:29 +0800
From: Philip Li <philip.li@intel.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
CC: kernel test robot <lkp@intel.com>, Andrew Lunn <andrew@lunn.ch>,
	<oe-kbuild-all@lists.linux.dev>, <linux-kernel@vger.kernel.org>,
	<linux-mips@vger.kernel.org>
Subject: Re: ERROR: modpost: "__delay" [drivers/net/mdio/mdio-cavium.ko]
 undefined!
Message-ID: <Z3CyoSB2hTDyGz7R@rli9-mobl>
References: <202412282326.0DSE4HbR-lkp@intel.com>
 <CAMuHMdUTtdQxyTUSd_NBiPvL6irb8p_2+=hk5PjUrXC4J=VrbA@mail.gmail.com>
 <CAMuHMdVHGz=0d_bGOu7RtF7-ssgnNmHk=MwEbTK77=+UgKGmYA@mail.gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMuHMdVHGz=0d_bGOu7RtF7-ssgnNmHk=MwEbTK77=+UgKGmYA@mail.gmail.com>
X-ClientProxiedBy: SG2PR04CA0163.apcprd04.prod.outlook.com (2603:1096:4::25)
 To DM4PR11MB5423.namprd11.prod.outlook.com (2603:10b6:5:39b::20)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5423:EE_|SA2PR11MB5097:EE_
X-MS-Office365-Filtering-Correlation-Id: 9c667f1a-ecfe-4f0a-d0e7-08dd27afcd6f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Z3NGdzBXQ01sb0c4Q2xKdk9jTDc2cWZnOTMzRi9NbDE3eGlYZmhqakJCbDcx?=
 =?utf-8?B?MWlRQ3dCeTNKd1dZZWlCMCtoT3kxcGZvVkhQL0owQTVTaXB2UmJjQlhQLzUr?=
 =?utf-8?B?UlY4VktsWVhvWXVqdFB5VXpFUjZBVDBvKzhFYkpkTTkreEhlZGFIcHFaRlBV?=
 =?utf-8?B?OHdERDFGNmtCeFNMUFl6U0Npa0VNN1V0RGhWQkVxSVRubnpSeEdhb1F5REVh?=
 =?utf-8?B?U1NDY082MnBXY0tHZXdKUlZIamlaRDA0aGx4elFFRmdjZjhhUWd0R05rUHl2?=
 =?utf-8?B?SFpJMGJEWG9zZHZxODdjWHBROVdFZkFaV0c5ZWVRb3NyWitrYU1VTWN6YWZ2?=
 =?utf-8?B?bzJlVDBTbnZTUndXeWEwM0d0Vk1BL3Q3YUlwZThzOVVsUGllMGtNcFRGWWU3?=
 =?utf-8?B?RldHNE1rYUNYZU51VmlOcGlQeTJrejZsRHJKdUR1WnlHcmtBT0xWUHVqeFB5?=
 =?utf-8?B?SjBiazc1akRTd2t0TDFWM3drYytTWGRjUzFsRGRYaUIyN0s4ajZrUHBUUDVB?=
 =?utf-8?B?SktlRmZ5Y0JOMFpBZ1UwdUxYM0k3WHhXcHAxWW5CNlZGMW54aEltdzVUR09V?=
 =?utf-8?B?MWFxZ2FiTnFqdGU4bmhvV1l1ZGtSWkk2R2Y1ZFM3R0VjSW83Uk96aUdjYjY0?=
 =?utf-8?B?bGhMUjRxeFhDZEZuYlk1Mk5yMWd1RDQ4NzN3eGtMa0x0ZjVvRk16OHNCc3V0?=
 =?utf-8?B?b2xHRUJ1OWxSRSsrdlZNdUl2bll6bjFjcE1oNXVnV2Q1VElEZGZmQXBmMVBX?=
 =?utf-8?B?dmgxc2M3M1NrTVNTQzY1cWU1SzhCeXFVQ1VjNG9JYU5TSGNVMU5qb000YkQx?=
 =?utf-8?B?b2ZlV3I4VlRUOTIzVm0ybGcwbVlVTEJBQ1FxWUZ3dEI0UmV3eCtZTFNqVExv?=
 =?utf-8?B?RysvdGVDRG9VR1Z5UndVYXdTcTAvSFdpNTJxc2VpbGZjT29rSTZ0Q3ZRMGlX?=
 =?utf-8?B?ZEhpU3o1YUtMdUljanpqY0xrb3pXRXA2N0FBcGNpdExjWmYrQXZhbTFQYndE?=
 =?utf-8?B?SjBlVzdWUEdVYVFSY2hUYmhZajRqOGc2U3pVelNOMEpFbTFhZUFWM01PdlNt?=
 =?utf-8?B?SjJuTWJ5K0dHWGU2Q3BQdGFlanRLUEl0ZlJOc01ZdG8wZ1hxZ205aElmekZk?=
 =?utf-8?B?YU1PbjR1TXppZnk0aTlKbk9KUHVIcXNaNnYvdGhsUUx1RlRya3pZaWRRR05k?=
 =?utf-8?B?azFxWjhHNUtUa1JINkhEcU45QXJ6aFEzb0V5cUs2THJIdjYzMWZrMzZFQ1ZR?=
 =?utf-8?B?ZDRnUHNnb09VdmVWZmt1WEhrc20yRjlPekNrQzBRVXBkZmtYZEd6bWRheWlv?=
 =?utf-8?B?Q1VKOS9KT3FBNFIreWtYbG42b3FlVS9xaFRpWGFxazlBcUFqb3BoNlc4S1hx?=
 =?utf-8?B?bnUwTTRlRlBnQ2hSZE0yN1EyN0JsaEFCSXVwaFlXZlNvckFuODA2WDBUdkxh?=
 =?utf-8?B?cGhvRE41cGZSZ0dQcHIyWXBPQlRObG5SL2k5U3lseTBsZFhPbXN3dXNibTJi?=
 =?utf-8?B?bzJqYnkvSkxMRTFXRWhZcUVybjkyaVFpVGRUdG1tcWsyeEdCSVpJanJZVS9X?=
 =?utf-8?B?eExOSlY3WnM4TGdaTFoxcmZSck5QWlJZM0U3QXZPTjZJcXhYSEZRdWx3SlJ3?=
 =?utf-8?B?Q2l5ak9keU9WREtnMW4vdjhkN0lMZG04d3piVWtYWE5oOXV4UmlrT2IzRkNE?=
 =?utf-8?B?WURZQ2NORzdIRm4reEJOa0pqbVNTbkNBdTlPQWxLay92a0orZzF0NCs2eGZs?=
 =?utf-8?B?OFFMSFhERGU1MHdhTmJYazltMC9Nc2VLRU5sbGJjME9ObkpoaVMxYy9RUW4v?=
 =?utf-8?B?c29Gb25VamJzeCtvRGY1dz09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR11MB5423.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RExFaDFtQVBCdWVNRHU1NEFlZU82akJMVVFMVUZJUCt0ejFMb3hRSTU5QzNz?=
 =?utf-8?B?NkV1dGhJdjA0SjErZ05nbTc4MFJHeklLdGNNMW9pekZIYlNTWjB4TVA4UmNr?=
 =?utf-8?B?bjVOOHBQc2c1MjkyNW5hWEc3SGVuTUwxa1FUM3VNdENwWjNxay9KMHRLMlJs?=
 =?utf-8?B?dVhxOVdXWVhWdXRwRzlCelJYaDlIWFArOXRaWFYyVXRmaFpFc1ZxaDZmY21Q?=
 =?utf-8?B?ak10cVdEMm0wOFRCL2JVTjJ4NjJXeWtOTXIrNGs4NTkvWlNsUVVRSjBMTnZZ?=
 =?utf-8?B?cksvVzBVY3d4R0JqYTdmTHJiSDNFK1FIaVk3UGdDaVA5U2pmRVVBR2h4VE4z?=
 =?utf-8?B?N0sza1dUMEN6NGt5U3ovQTVoRjBvMDFXeTI0SkNIR3llZWpTTUVyL0dCWjFT?=
 =?utf-8?B?YjRob0tEU0E0WFN6dDBGaWRybklCbzJNdS94YzdDQlliRlJNUW8ydlI3VUpN?=
 =?utf-8?B?RnE1azk2WGR4VnRtMTEyd3gvemg3eitNWHF1TkRqbmRnZFhidmppWXRnZzFV?=
 =?utf-8?B?akpWWU9WUjJOR1VVdU85VWlRa1lwYWVsaWZ0Uk9ocGYySjRiSHpFaGlkWHB2?=
 =?utf-8?B?MG91OWNPOTVCRG5PMW82ZzVaUVQ0Q1J3UkRvclJNa1lERzhCTTlySzl0OTZT?=
 =?utf-8?B?TDdQNmxBTU5PMXhFZm9VTmZHYzNRb1ZncThSMk5kNlFhaWd6enJsOGFMNFRi?=
 =?utf-8?B?VEcxTGhLZmlzZUpvcnRUK2hKaW1ZMCt5cnhWd2tNcW9qcjlpU3BDd29pd3Yx?=
 =?utf-8?B?VjFRS3JQby9icm10bkNjYldwYUw5bnViQWJNcjNWNmVncEZERjc2Q0FFSytS?=
 =?utf-8?B?czFOWWVneHBJQ25adkc2MUJQTDFxMkRDWHhzOTNBTHJrYTNnY1NmMlZ1S3d6?=
 =?utf-8?B?aG5RcnArd0J4aXk1YmJTa21KcTRsU3JVZEtrRVlwMUdJVDZ6eUlZQVJPbVVF?=
 =?utf-8?B?aWZ1bitPT0R5T0J2d0gwbGtLS256VGczZGQ1d0NEamJSQmJFdE5TekhKUXdp?=
 =?utf-8?B?dCtac1hlNTY2TTcvVExuc2tzSnhQTUdFUHlxazNhcHBsK0U4Y1FaaGZ2bFY3?=
 =?utf-8?B?NXJyNnp5UkZ4RkpCcXN1QTIvbWFoZjdRbURHdlVjdXM3eTVFY3JIdWhvWGxk?=
 =?utf-8?B?aUtMcWpTa0RqdzhzcTcwUFFVMjBxTkFwYm1WQi8wNHozYmgyT0U4TGVkVU9R?=
 =?utf-8?B?akJQUkNDblFZVGxqQ1E4RWhvY3k3MTg2d09sOTdFOHplcWJUVzZ0UC9NRVh0?=
 =?utf-8?B?aUgyL2Vnc0RPQVEva2pvSW5sdW94dWo1NkplRW1uZTFSNy9DWmdzZWZzamt4?=
 =?utf-8?B?Ymp3RWEzdmFIODR6QXlSMVZteUxXY3JvN09jV0swYVI0bkxMbVlDdGN3U2ZH?=
 =?utf-8?B?bFhIYzluYlI3UjV2eXlCODh1OTkzTmJzdkVRSWFPUVVVUnZ5MWZjUjVLRytk?=
 =?utf-8?B?YUZBRC8wb3VLN0drQzkyL3h2SEZ3bnI2cm42dzVNUklEck5WMGdLb1lXaHRt?=
 =?utf-8?B?OTQvR2FxOVJNRndjeThXNDlBVEFvTk90NnlLRDdiSHdVeXBzNi83VEROY0Zr?=
 =?utf-8?B?UHZTYnU1MVNOTytYM0lyU3B2NTlMNEk3UlJoV2llcDllN01hK3dKNHFCZkZy?=
 =?utf-8?B?dHhVMkkxMG1IZGRjZzFMYldoWlpKakkrRW5RVW9SMk1lTGVsNlpuUHJQaDdV?=
 =?utf-8?B?RjVCbjRBMk1wSkd2RXJla3BtS3JFK1p6VXh1bHV1UVN3cTVzRnlHZWxabXpq?=
 =?utf-8?B?ZnFiUGErR1ptWS8xbFdpcUM4NU1BaDE4WUlhc3VIRU1LMFRVNnk2YWxSbGpY?=
 =?utf-8?B?bW9xRWo4dWplcFBPSlhEV1ZFTHRrNS8wbWVpRE5VUWJ0TENqQnlSY0pLalFI?=
 =?utf-8?B?Z1FxTk5UQ3djK3h0bzJUQjJlTzIyQXVEZHFiTzA3cklQc0lsYm43am9tSG4y?=
 =?utf-8?B?VGozRTZtcHRML2RBWDVLWWtNdUFlVzlUenpzUjB5Ykh2VnRaKzhRSU51YUts?=
 =?utf-8?B?WE9jUm5DSzB0UmRCZ1JKcFd5WnRnNnZZOUxBelpLOTI2UjVwZSs5YXZpUW0v?=
 =?utf-8?B?Ym1UMTM2eHNDeWVVL21VTWx3VjdhdDNlWXIzZkdVOEMxSVZzYUREeWFiSERm?=
 =?utf-8?Q?bULLt+MA6fWZOKTlfCbbiDBBd?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9c667f1a-ecfe-4f0a-d0e7-08dd27afcd6f
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5423.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Dec 2024 02:23:37.7945
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4elvMiLZFOMcYKqwMZ/hjy5Dgh6e1Xwtm8OYBAd2Dl8Q7igJ6cpiIzDrJEAcWHKIw+zJDF6T1BKSF8M/01/guQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB5097
X-OriginatorOrg: intel.com

On Sat, Dec 28, 2024 at 02:55:02PM +0100, Geert Uytterhoeven wrote:
> On Sat, Dec 28, 2024 at 2:50 PM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> > Hi Kernel Test Robot,
> >
> > On Sat, Dec 28, 2024 at 2:36 PM kernel test robot <lkp@intel.com> wrote:
> > > First bad commit (maybe != root cause):
> > >
> > > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
> > > head:   fd0584d220fe285dc45be43eede55df89ad6a3d9
> > > commit: a9770eac511ad82390b9f4a3c1728e078c387ac7 net: mdio: Move MDIO drivers into a new subdirectory
> > > date:   4 years, 4 months ago
> > > config: sh-randconfig-001-20241212 (https://download.01.org/0day-ci/archive/20241228/202412282326.0DSE4HbR-lkp@intel.com/config)
> > > compiler: sh4-linux-gcc (GCC) 12.4.0
> > > reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241228/202412282326.0DSE4HbR-lkp@intel.com/reproduce)
> > >
> > > If you fix the issue in a separate patch/commit (i.e. not just a new version of
> > > the same patch/commit), kindly add following tags
> > > | Reported-by: kernel test robot <lkp@intel.com>
> > > | Closes: https://lore.kernel.org/oe-kbuild-all/202412282326.0DSE4HbR-lkp@intel.com/
> > >
> > > All errors (new ones prefixed by >>, old ones prefixed by <<):
> > >
> > > >> ERROR: modpost: "__delay" [drivers/net/mdio/mdio-cavium.ko] undefined!
> >
> > The real issue was introduced in commit 1eefee901fca0208
> > ("phy: mdio-octeon: Refactor into two files/modules").
> 
> Silly me: commit 2fd46f47be0f96be
> ("netdev: mdio-octeon.c: Convert to use device tree.").
> But even before that, the driver used a different non-portable construct.
> 
> > Drivers must not use __delay() directly, as that is non-portable, and
> > doesn't work in the presence of cpufreq.
> 
> And looking at
> https://lore.kernel.org/all/202412282326.0DSE4HbR-lkp@intel.com
> all of this has been said before...

Sorry Geert about the false report that costs your effort to check, we should
avoid reporting against this commit after that discussion. I will fix it asap.

> 
> Gr{oetje,eeting}s,
> 
>                         Geert
> 
> -- 
> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org
> 
> In personal conversations with technical people, I call myself a hacker. But
> when I'm talking to journalists I just say "programmer" or something like that.
>                                 -- Linus Torvalds
> 

