Return-Path: <linux-mips+bounces-7940-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D177FA435EF
	for <lists+linux-mips@lfdr.de>; Tue, 25 Feb 2025 08:09:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B940B179935
	for <lists+linux-mips@lfdr.de>; Tue, 25 Feb 2025 07:09:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A4487257AFF;
	Tue, 25 Feb 2025 07:09:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Iurq/2ER"
X-Original-To: linux-mips@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF791254875;
	Tue, 25 Feb 2025 07:09:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.18
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740467346; cv=fail; b=GiHKNcYNThSVfHqdv3icTUv9eR4mTWenpfSffUrzOi8WnVQPLJuNzEgZj/alXn+u4HpI9TZtsxrWfV1DMUuUfM4KD+Un3JlE5ys+QPLfgtcTtpsTaG4NWaUAgc0rOKhZk9JJtSlwwb4qmZB9X9EojDHuWhcN2MaJlBGmSGXrIpk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740467346; c=relaxed/simple;
	bh=eTKW4tIj/TRozU+6PY5F6bbQAl+0TY6LvDgVxjRH2iM=;
	h=Date:From:To:CC:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=OsYj0/Llks04tn7tpPsNxoE4Dusv+kvoOfO1iqEu6DIh72f6LrbvRowgP7bX1NEnnCFF9lj36+Fw7l6tszDRI+J3FhoKbADGgF0/HZmeJlLcF/JzbGCrUSMomWAHOq7EYSnVsuaxhZIGNO0WYtrykMMZugqxZ4NzT0UNMLjanm4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Iurq/2ER; arc=fail smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740467345; x=1772003345;
  h=date:from:to:cc:subject:message-id:reply-to:references:
   in-reply-to:mime-version;
  bh=eTKW4tIj/TRozU+6PY5F6bbQAl+0TY6LvDgVxjRH2iM=;
  b=Iurq/2ERzhzTB3ZuR7gj5IV3H45k2K79+bQ11WTCQUzXVhYB4r411sgy
   JcRJKIwjDlw9+ly7g7fACngqS4xCXaC47HoKPA1RCQnFe3+GbGFvFtQp+
   TO0JseQMnVqpSfBPoPMLgQ7W72NQVyfRJBBXw5B3YHgzj0iYQ8laNlnEv
   WZFKpqTFwpw3RakxZdd1Mki1zN1kBe6lyURuVpnqxGP6ipcm9c29Npp8I
   zcsC1C7WVNigsT3AOmmZjaERqjCV9XRCqDtzr8U10c3IlXPmMKdFMbY5B
   60Wcz7/bUGjaJidZG7w6rMK42a6lTyvoW5NRRgWlAZZGBM8wc8GgFasSa
   Q==;
X-CSE-ConnectionGUID: QwTU45ESQ6azmu9mFi0MeQ==
X-CSE-MsgGUID: VAOqxHanR4iCmf0SY0SeCA==
X-IronPort-AV: E=McAfee;i="6700,10204,11355"; a="40494789"
X-IronPort-AV: E=Sophos;i="6.13,313,1732608000"; 
   d="scan'208";a="40494789"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Feb 2025 23:09:04 -0800
X-CSE-ConnectionGUID: hl0N50cyScCx0qmFJdRd1A==
X-CSE-MsgGUID: pOYuvs0uSj60P8N/F5CYJQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,313,1732608000"; 
   d="scan'208";a="121398313"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
  by fmviesa004.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 24 Feb 2025 23:09:04 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Mon, 24 Feb 2025 23:09:03 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Mon, 24 Feb 2025 23:09:03 -0800
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (104.47.74.43) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Mon, 24 Feb 2025 23:09:02 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VuAUjOU3BNEwz+lEczWn5mcBVF7o4zS9H/kq4VnhpqoPZFeHorMxSAykniqKJArlHba1af5AfoFruNCWoM6bbMLNmTVIIHM/Kj4wVA1mnfbSTtdA0D5b8xIZH5vFsnNBflU6+s30wgbmqfzFCCUGhSS9opFYPOu0X14j3ELcb/8MeQyGM7XOHc0kRX1hbtWMZwXY7JVbiJ0ELveH651W4gjDNeNpB2C2MOsFGhcz8jkKPniPnnAUNzXLR9fSnxhttP7V2rhDYlaL+85kraD41M4MKn+gwjjP854Lr0KfCZI4JAODapWYMInWzwsGUn9mMiQVoBkiiJ1EIHErFoZWog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SMcg7oV1LXKpFEumlGiY2hKhy5CGBtvnnB2HEmDiGfE=;
 b=btgTtbW7n4RcQaYjQYPN5ddmtwtaYzwUUu5hcpSZ04X3noT2UW6b6tgW0AYP8aD/YUj5j+wV/40O5HuRVy2v7u9UTAqQiHbD1kCU+8himR8Ovs2iZIUFX5SSux2g2jnHkTGrYtqabmcnMGwGdIexwkakU6epmEWhPNCgnbKvVvzUNbTtqAtYQpkerCtjoEcpCV9CyUO8Fx5wEw/6RpdOOM/LuYGIn+xZ0lpPKBeCY3OWrKxZ65eIso0eYWLDSqds+n1w8MMoMAvwXzHt7hxWCbVS5x69Eej66Eo7NRErX2kitOEj+EwIsFG1n+yvghcTnnGl9drOuDrB3G5T9qfw/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS7PR11MB5966.namprd11.prod.outlook.com (2603:10b6:8:71::6) by
 CH2PR11MB8777.namprd11.prod.outlook.com (2603:10b6:610:283::6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8489.18; Tue, 25 Feb 2025 07:08:59 +0000
Received: from DS7PR11MB5966.namprd11.prod.outlook.com
 ([fe80::e971:d8f4:66c4:12ca]) by DS7PR11MB5966.namprd11.prod.outlook.com
 ([fe80::e971:d8f4:66c4:12ca%4]) with mapi id 15.20.8466.016; Tue, 25 Feb 2025
 07:08:59 +0000
Date: Tue, 25 Feb 2025 15:07:36 +0800
From: Yan Zhao <yan.y.zhao@intel.com>
To: Sean Christopherson <seanjc@google.com>
CC: Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>,
	Tianrui Zhao <zhaotianrui@loongson.cn>, Bibo Mao <maobibo@loongson.cn>,
	Huacai Chen <chenhuacai@kernel.org>, Madhavan Srinivasan
	<maddy@linux.ibm.com>, Anup Patel <anup@brainfault.org>, Paul Walmsley
	<paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
	<aou@eecs.berkeley.edu>, Christian Borntraeger <borntraeger@linux.ibm.com>,
	Janosch Frank <frankja@linux.ibm.com>, Claudio Imbrenda
	<imbrenda@linux.ibm.com>, Paolo Bonzini <pbonzini@redhat.com>,
	<linux-arm-kernel@lists.infradead.org>, <kvmarm@lists.linux.dev>,
	<kvm@vger.kernel.org>, <loongarch@lists.linux.dev>,
	<linux-mips@vger.kernel.org>, <linuxppc-dev@lists.ozlabs.org>,
	<kvm-riscv@lists.infradead.org>, <linux-riscv@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, Aaron Lewis <aaronlewis@google.com>, "Jim
 Mattson" <jmattson@google.com>, Rick P Edgecombe
	<rick.p.edgecombe@intel.com>, Kai Huang <kai.huang@intel.com>, Isaku Yamahata
	<isaku.yamahata@intel.com>
Subject: Re: [PATCH 3/7] KVM: Assert that a destroyed/freed vCPU is no longer
 visible
Message-ID: <Z71sOEu7/ewnWZU2@yzhao56-desk.sh.intel.com>
Reply-To: Yan Zhao <yan.y.zhao@intel.com>
References: <20250224235542.2562848-1-seanjc@google.com>
 <20250224235542.2562848-4-seanjc@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250224235542.2562848-4-seanjc@google.com>
X-ClientProxiedBy: SI2PR02CA0051.apcprd02.prod.outlook.com
 (2603:1096:4:196::10) To DS7PR11MB5966.namprd11.prod.outlook.com
 (2603:10b6:8:71::6)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR11MB5966:EE_|CH2PR11MB8777:EE_
X-MS-Office365-Filtering-Correlation-Id: b7115154-ea32-41f4-6f38-08dd556b46cb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|366016|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?NNOpC3XG3aV5NG3Scy++IW05X2Frah4OjNFzgpiHW1pgoxathH2IyFCJOol/?=
 =?us-ascii?Q?l5A2JC+R5dHfsL65olFA+tdvQE4r8PGMOS7Ju31vhrgZkZ9ehsK8VK4aatYv?=
 =?us-ascii?Q?V39w8rQYnVjvN4DHdQ3IsjV5HbCDMOAgoQMJS/WzlC5mJ3cTAqdpu5oL1YZX?=
 =?us-ascii?Q?820Be08zrpbD3Jk4DgTYYZIsCasA0Kbyl1RaTFaiNH/gMlUjmfkq+sOt8lvy?=
 =?us-ascii?Q?C2/5uPFNKKpk2vYU7HTpsVvUpu5grrd236HkXB6QIM6j6i0phYmdOLW+rOlA?=
 =?us-ascii?Q?JIMc7yd3fzqXyAYOR9mK/lGn3V3NSt8m6Z2TSYaYJaBhS8etsrGvgzA4/vHL?=
 =?us-ascii?Q?UOb0FdIWys9AA+sda4isNxULMYm/xlzJKmnoNsgOQ1DtZqls2ZenEPucsj5l?=
 =?us-ascii?Q?KS/4EDs28/Z4yyUKR51DfPTequdMoh7uImnNi25J9DvqPDYrOlaFFHayyQ4L?=
 =?us-ascii?Q?Wqut3iNHk9gGmlaGLDDuFVOle+V2CeeJakfHZOG4gc9A9BWcPmxtjlOYnuE4?=
 =?us-ascii?Q?69UFCrvIv+JgIz8hpWUoaLQCWjaUD7oEe3k6+xcNrxYlEZtfWgJ6Ibft8k2L?=
 =?us-ascii?Q?ao9nWn7nQNt8BO+2HBCskGD0qmLPZxDv6PNa1R08qmynV3OZB1vrfNirfZPf?=
 =?us-ascii?Q?+Kha8EaTzySU5YO9ENwA+SyYxirh+RMXtSDi565UuDCEESOXJY3pH6uDXZIp?=
 =?us-ascii?Q?OCJz6nfGUclzikUCBELtP1AoA8sEyscjQLyQV6jJ03xXYr0nh6ZMX2wLTyX3?=
 =?us-ascii?Q?FWjjc6YE4gdak/3K36yeAWohAgvMGun+p+Un1lTxL9+vAKknEdgCDKWBV46t?=
 =?us-ascii?Q?pzcYxrWynJBFUCWrEnk+NBCnjFkYkCGI8iKNR7ZKR4VhqSuk4OxSO0CfKYb0?=
 =?us-ascii?Q?/Tux+CqTPchiUHjy2GntWgexracKq8r6GEZ56OfrPZqKwcinPh3r6efHN3BD?=
 =?us-ascii?Q?g+gNTObBuaWrfe4wRGieBGUvQHphALaldeCxDNtzIs5NhY0aaVB67kJQ3vP2?=
 =?us-ascii?Q?G6J9+tPp2FeNCWtyc8NBWgZeZpdvf6S6bUkbjZQE4Mr1I6bOBGVSdGRFLiYv?=
 =?us-ascii?Q?PFv+xUNQjJYOmE2qxisQ8YjR91VELEm420xYsDjgkBBptXMYpFA6JL8srFey?=
 =?us-ascii?Q?M/DDp7IkeqBEMvIX6WU6AHoc8kMUcj3uQxu+yIPOdoq34wSjAh4NCnzwBXQG?=
 =?us-ascii?Q?5Tw6eixuaoe9BLFvv5b09gGtrb8bncmuCkv3uJgr2LKLLFg+vryLXc30UmVB?=
 =?us-ascii?Q?hVYvLcWjDlqHKc+qUv7eXa33S1fZMe6tWCBlFmC5n3K2z9zJ4AjRfojKUgcv?=
 =?us-ascii?Q?5t97Eh7a4mX9Fwj5YKJfg14xIl1Oyb2GeMXqWMfuC1Xvg/RrXNTvA4zG0gZ8?=
 =?us-ascii?Q?/fl+gvMHzMYaITfbfxEbljqbWFYF?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR11MB5966.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?7J1miUGVZAH/kHXubyQ4DNTdbAvP6CGGafgIvapufRQHwoOw5S3Wosk+pTEJ?=
 =?us-ascii?Q?MdH/jxKtCkVfh5nobxWyBbiKcNm5jalMH3fRkYTD6kBpB6Fh+Ohd1rQN3p/W?=
 =?us-ascii?Q?NUptsJp0TtuNy6jBn5Gi/DcB8Mp39cZd04cgO8wBPaT8JjZ/XYqB/X9uUP5h?=
 =?us-ascii?Q?XnTmDVBhlcGDTCOaYlMYsRHZHekVO4wQCoqhRZg+VCeLz3IXnEPv1uv3UkwH?=
 =?us-ascii?Q?YTOaGkngLVar9RmR1ONhTbcDqPaqeflnSSegjw2k/tpUXfJ4/jncPEn2B6qt?=
 =?us-ascii?Q?S6F8/q2dWwClhkH84Feymy8RJ/R74FiAth7B+wrtxTLKkg4NYai02OA2hEmv?=
 =?us-ascii?Q?Mfxv226mIvn6FHqcqHqKgROKX+I0i2i8zyWSfrcPJ3wEJqdSArfzS/GXsAji?=
 =?us-ascii?Q?6J2rHIHsWYGyc1a1qRIJ6i2KR3t3P6gPH2KJeU6i9RH5YGpVhTwn5YD39p51?=
 =?us-ascii?Q?CHnzSv4TNKul5sOngdp/F79MZddTVvqHDwdwWjGv4Ur4S6FcQvBBsFzIvpT7?=
 =?us-ascii?Q?708+phKGxjRSzA+iV89JBN5KUFccLCuitR3jTEet3MSCfMcYU0OJ9iksq0wM?=
 =?us-ascii?Q?OtkRcY6WxlOMyFLacXSyjrlaO7Yviyauqkwtg1EBwEeA5wDp88ZI4ZnQxMF7?=
 =?us-ascii?Q?BZi2lh/Eq0FWwVf/3ajvQKl+GOFvpnmamjXF75vInwDvUyfAE5vLcF5Qq636?=
 =?us-ascii?Q?Lzy+zA7UAfujSoMCglrd3q+zJnC76AaL/qowMXf30thWGhUeuuOedZaty6y4?=
 =?us-ascii?Q?cv72mw2lQO+szcLsadrw+sZ59twIl25utQCAcayJP/BofC+ovsPmCKILknLH?=
 =?us-ascii?Q?R1XTTIHBMHrSaGgdPjWoThm+kumG9zeaDc6L5d74uya9ur+5rPzQrlcL8uWd?=
 =?us-ascii?Q?9VCPYuOIuXME+UGFx1ZJyX95B2afIC6/0ZZ2BT7bHbg2HgpEVYZstzBhXDAF?=
 =?us-ascii?Q?LBKZcRSoxtkTCpLH0pUD6q4qO8KsPGRYsN+yU1cdMzA8TIUHx5GbypPmo812?=
 =?us-ascii?Q?mpBXRy3dV4gMyKl6g4bf/345O+Ypfuef8y5VzCivj4IAlLzV7SBx3+RAaBgc?=
 =?us-ascii?Q?8WRKb6StoLJXtsEN8fV2jG5nJu7qJofsXWOXpiQNdz7zAvarFqnDagfFp9mT?=
 =?us-ascii?Q?TeE1ZTLgp9QpSJEuaguVkXE8ANyESEwzS6LttLj5x4nGwb/CpIKsAnuC05dQ?=
 =?us-ascii?Q?koBmDcQq9aTfPPQTJLAGm7QYT0K6h8nBYVsxnT4kHW6BWLShvoHd7+9gBII9?=
 =?us-ascii?Q?4Yw2XT2R2pRK5G83vaziWszCeBwb0LVLHHlbfDZD2pLiYq6jnitdeJpOoOVD?=
 =?us-ascii?Q?1Eo4TmE30cjJ22uiBh4eV0FLpLw1DCZ//c/eRDTLYkIYoSrQTPsv/pZ+6hg7?=
 =?us-ascii?Q?W8dodXkx8/FNTjWRFtA/exuTGsKTR/mIYeAJL2457/xtISxbfQog+38II9Nu?=
 =?us-ascii?Q?ECaESGll+CsIzAWkmBDsWw+MT+G4WjbHXP+I8LKm0ceU2FuWkU/ulV/Xrh11?=
 =?us-ascii?Q?dAV/VEqJbDiWMO27Lt6kxWVJLz8S9hW2SjwjgWpwEkKsO6XBYQ8t2o7XmbLA?=
 =?us-ascii?Q?FnTmzGqPXHzSF9XapWxhgatdGZm52bil+brXstjf?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b7115154-ea32-41f4-6f38-08dd556b46cb
X-MS-Exchange-CrossTenant-AuthSource: DS7PR11MB5966.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Feb 2025 07:08:59.5466
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Gm6KSgUaiPOqhmWPyuhNptHBci3vufBKWkhCUqaIhlJIfW0tRLSgHrpcqOleYUx1AtM6/jrSkN7eyQFRI8gNLA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR11MB8777
X-OriginatorOrg: intel.com

On Mon, Feb 24, 2025 at 03:55:38PM -0800, Sean Christopherson wrote:
> After freeing a vCPU, assert that it is no longer reachable, and that
> kvm_get_vcpu() doesn't return garbage or a pointer to some other vCPU.
> While KVM obviously shouldn't be attempting to access a freed vCPU, it's
> all too easy for KVM to make a VM-wide request, e.g. via KVM_BUG_ON() or
> kvm_flush_remote_tlbs().
> 
> Alternatively, KVM could short-circuit problematic paths if the VM's
> refcount has gone to zero, e.g. in kvm_make_all_cpus_request(), or KVM
> could try disallow making global requests during teardown.  But given that
> deleting the vCPU from the array Just Works, adding logic to the requests
> path is unnecessary, and trying to make requests illegal during teardown
> would be a fool's errand.
> 
> Signed-off-by: Sean Christopherson <seanjc@google.com>
> ---
>  virt/kvm/kvm_main.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
> index 201c14ff476f..991e8111e88b 100644
> --- a/virt/kvm/kvm_main.c
> +++ b/virt/kvm/kvm_main.c
> @@ -489,6 +489,14 @@ void kvm_destroy_vcpus(struct kvm *kvm)
>  	kvm_for_each_vcpu(i, vcpu, kvm) {
>  		kvm_vcpu_destroy(vcpu);
>  		xa_erase(&kvm->vcpu_array, i);
> +
> +		/*
> +		 * Assert that the vCPU isn't visible in any way, to ensure KVM
> +		 * doesn't trigger a use-after-free if destroying vCPUs results
> +		 * in VM-wide request, e.g. to flush remote TLBs when tearing
> +		 * down MMUs, or to mark the VM dead if a KVM_BUG_ON() fires.
> +		 */
> +		WARN_ON_ONCE(xa_load(&kvm->vcpu_array, i) || kvm_get_vcpu(kvm, i));
As xa_erase() says "After this function returns, loading from @index will return
%NULL", is this checking of xa_load() necessary?

>  	}
>  
>  	atomic_set(&kvm->online_vcpus, 0);
> -- 
> 2.48.1.658.g4767266eb4-goog
> 

