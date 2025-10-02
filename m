Return-Path: <linux-mips+bounces-11598-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 79D1DBB5A03
	for <lists+linux-mips@lfdr.de>; Fri, 03 Oct 2025 01:40:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id F3A58342A37
	for <lists+linux-mips@lfdr.de>; Thu,  2 Oct 2025 23:40:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 69AD62BE658;
	Thu,  2 Oct 2025 23:40:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cisco.com header.i=@cisco.com header.b="e2rHI4Hn"
X-Original-To: linux-mips@vger.kernel.org
Received: from alln-iport-6.cisco.com (alln-iport-6.cisco.com [173.37.142.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62C32188580;
	Thu,  2 Oct 2025 23:40:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=173.37.142.93
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759448431; cv=fail; b=pskcGiv6z/Jd469wVA6mWxOKMAekZaJd2ZODMG1suZgJ9aCmVcKoWEcNUUhtNYJl4YgK9x+meIJo+67C1D6/UWeL3m5G5Le0KqX0MM7pj6adyCTj77A5PPfpBYpjIoimaYEn1pxEyRuwJIOUmns5HnpbO1wtpYI/bDBLKjlKnJY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759448431; c=relaxed/simple;
	bh=MGFntG+8LTEEZQZvFsOK0wSGIk6QrW7tJSyUbntOSQw=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=IfwIv55YTUoqo2Dw6EDi9CjmnMyeqP/VOFZuZ3S/I+4FLXsbnJ2Iz1ZHzj0QNDxhJfeIBvXpi5TYhsB0KEG8vdC14D/+Fq+Lnejk90IJciGORYZMALJ0polyRHTpnyoxLaX4d7G1m8vKZW9rpKxwrv02oTByiU3jJaZqN++/0YI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cisco.com; spf=pass smtp.mailfrom=cisco.com; dkim=pass (2048-bit key) header.d=cisco.com header.i=@cisco.com header.b=e2rHI4Hn; arc=fail smtp.client-ip=173.37.142.93
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cisco.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cisco.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=2363; q=dns/txt;
  s=iport01; t=1759448429; x=1760658029;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=tCNxOvSZ7dfQx83Z+gpSwBDza+z/Dj56WuMUJqqOias=;
  b=e2rHI4Hnuts9IYHOERFcoOGtb9lhLCdK0jbwzPmduXWHuM8oZmDpmNNd
   GKnn4ky9ktEhbOkmo2qVOfphErZySy2W8NzGXDqEnFWkOqCMIkBpA/1vE
   yVXLZM8YKZZE8rV+8vCGOTuiaNmS8lLnMCYdrYPK6icHLSTbFdLMIJ6Fc
   rCn00dUx7CJZ5ehN1OSJscTKGF9lBuVqg8Ju/SGSXAt6pcDjB6LXLEjN1
   VyM4qSZpg0/GLyTNn6RPhdLkckwygBzSaxizZrigw+piTibn2Ye+lcISt
   y9T9rTAgxCrU4Yy7fL2Fj+2v1Csxe/+sD1v/6p21s0TjX65MXdk04LvNq
   w==;
X-CSE-ConnectionGUID: CRyG0JODSXWuakZ9vsBI0g==
X-CSE-MsgGUID: YeuW2uMrQUi8cqJAebz4yQ==
X-IPAS-Result: =?us-ascii?q?A0AtAABpDN9o/4wQJK1aHAEBAQEBAQcBARIBAQQEAQFAJ?=
 =?us-ascii?q?YEaBwEBCwGBbVIHggUSSYggA4RNX4ZVggQdA4V6jHGLLxSBaw8BAQENAlEEA?=
 =?us-ascii?q?QGFBwKMRgImNAkOAQIEAQEBAQMCAwEBAQEBAQEBAQEBCwEBBQEBAQIBBwWBD?=
 =?us-ascii?q?hOGXIZaAQEBAQIBEig/BQsCAQgSBh4QECEXDgIEDgUihS0mAwECo34BgUACi?=
 =?us-ascii?q?it4gTSBAeAmGIExAYhQAYVshHcnG4FJRIM9gQI+hA4BEgEhhkQEgiKBFop1h?=
 =?us-ascii?q?TyPU1J4HANZLAFLCjUMM21DA4EySwU3aBJAd4QUhB6DFnKBdFdBgUsYgg5xD?=
 =?us-ascii?q?waBFRlJAgICBQJDPlqBEAYcBh8SAgMBAgI6Vw2BBHQCAgSCL4ESgioPgXEDe?=
 =?us-ascii?q?D03FBsGmWeEBm0UHIFdBw+WewGaBIEElRcKhByiN4NxjROZVJkGpAiFDgIEA?=
 =?us-ascii?q?gQFAhABAQaBaDxpcHAVgyJSGQ/VSng8AgcLAQEDCZNnAQE?=
IronPort-PHdr: A9a23:7VhOihGYKVacMCDmJyfn4p1GfhMY04WdBeZdwpMjj7QLdbys4NG5e
 kfe/v5qylTOWNaT5/FFjr/Ourv7ESwb4JmHuWwfapEESRIfiMsXkgBhSM6IAEH2NrjrOgQxH
 d9JUxlu+HTTDA==
IronPort-Data: A9a23:o6AsBK+IUlWhDoEc+aBzDrUD6H+TJUtcMsCJ2f8bNWPcYEJGY0x3m
 2JKUDjUbPrbZGSnKIsiady+9UpTsJfSx4dgTANu+XhEQiMRo6IpJzg2wmQcns+2BpeeJK6yx
 5xGMrEsFOhtEDmE4E3ra+G7xZVF/fngbqLmD+LZMTxGSwZhSSMw4TpugOdRbrRA2bBVOCvT/
 4qiyyHjEAX9gWMtajpOs/nrRC5H5ZwehhtJ5jTSWtgT1LPuvyF9JI4SI6i3M0z5TuF8dsamR
 /zOxa2O5WjQ+REgELuNyt4XpWVTH9Y+lSDX4pZnc/DKbipq/0Te4Y5nXBYoUnq7vh3S9zxHJ
 HqhgrTrIeshFvWkdO3wyHC0GQkmVUFN0OevzXRSLaV/wmWeG0YAzcmCA2kdB5w3osRQLVp+y
 uERKwJccAupprq5lefTpulE3qzPLeHiOIcZ/3UlxjbDALN+GtbIQr7B4plT2zJYasJmRKmFI
 ZFHL2MxKk2cO3WjOX9PYH46tOuhgHjydyJRgFmUvqEwpWPUyWSd1ZCwb4KNJYPRGpk9ckCwl
 2/bwD7kJwsjCd3PwiOn23+mlLPepHauMG4VPPjinhJwu3WXx2oOGFgVWEG9rP2RlEGzQZRcJ
 lYS9y5oqrI9nGSvT9/gT1i9oWaflgATVsAWEOAg7gyJjK3O7G6k6nMsRzpFbpki8cQxXzFvj
 gTPlNLyDjspu7qQIZ6AyoqpQfqJEXF9BUcJZDQPSk0O5NyLnW35pkinogpLeEJtsuDIJA==
IronPort-HdrOrdr: A9a23:Y6+1Eaux5gvFUyUc2ZY5gL8J7skCCoAji2hC6mlwRA09TyXGrb
 HMoB1L73/JYWgqOU3IwerwRpVoIUmxyXZ0ibNhW4tLxGHdySWVxfJZnPrfKlrbamzDH49mpO
 hdmsdFeafN5DRB/KLHCUyDYqkdKbq8geCVbIXlvgpQpGhRAskKgXYae2Om+w9NNXV77PECZe
 OhD7981kGdkAMsH7yG7xc+Lo/+TvTw5eHbSC9DLSQKrCOJijSl4qP7FR+34jcyOgkk/Z4StU
 L+v0jc/KuMj9GXoyWw64bU1ftrseqk7uEGKN2Hi8ATJDmpoB2vfp5dV7qLuy1wiP2z6X4x+e
 O84SsIDoBW0Tf8b2u1qRzi103LyzA18ULvzleenD/KvdH5fjQnEMBM7LgpNycxqnBQ+O2U4p
 g7mV5xhKAnVC8oWx6Nv+QgYisa0XZcZ0BSytL7wUYvC7f2I4Uh3bD3tHklYqvoWhiKq7zO1I
 JVfZ3hDDE8SyLGU1nJ+mZo29CiRXI1A1OPRVUDoNWc13xMkGl+1FZw/r1Uop4szuN0d3B/3Z
 WODo140LVVCsMGZ6N0A+kMBcOxF2zWWBrJdGafO07uGq0LM2/E78ef2sR42Mi6PJgTiJcikp
 XIV11V8WY0ZkL1EMWLmJlG6ArETmmxVSnkjste+596sLvhQ6eDC1zPdHk+18+75/kPCMzSXP
 i+fJpQHv/4NGPrXZ1E2gXvMqMiYEX2kPdlzOrTd2j+1f4jcLeaw9AzWMyjUIbQLQ==
X-Talos-CUID: 9a23:3KGsYGF+Nhu1eHTmqmJMzl87QuICXkbt82rZIH3pF31DaeWaHAo=
X-Talos-MUID: =?us-ascii?q?9a23=3AJWHKQg16HDdGx2tuQXDLXQtKWjUj0qmzNxoQtI8?=
 =?us-ascii?q?/hsjUPjVSEjqXnmime9py?=
X-IronPort-Anti-Spam-Filtered: true
Received: from alln-l-core-03.cisco.com ([173.36.16.140])
  by alln-iport-6.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 02 Oct 2025 23:39:20 +0000
Received: from alln-opgw-3.cisco.com (alln-opgw-3.cisco.com [173.37.147.251])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by alln-l-core-03.cisco.com (Postfix) with ESMTPS id 4283618000417;
	Thu,  2 Oct 2025 23:39:20 +0000 (GMT)
X-CSE-ConnectionGUID: oeELfB4NQm2azP0xtbvtCQ==
X-CSE-MsgGUID: TnA9KwhLR1K8tmcJZhQQTw==
Authentication-Results: alln-opgw-3.cisco.com; dkim=pass (signature verified) header.i=@cisco.com
X-IronPort-AV: E=Sophos;i="6.18,310,1751241600"; 
   d="scan'208";a="34141129"
Received: from mail-ph0pr07cu00605.outbound.protection.outlook.com (HELO PH0PR07CU006.outbound.protection.outlook.com) ([40.93.23.93])
  by alln-opgw-3.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 02 Oct 2025 23:39:18 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gOnszKHN8wuCt4FpOu32VkLnhXNPGHZlzslC7u01iZxW4fmumDPGJe2EYJOus5UjBlaqPK18HQUq7R9rAPjZf3GoNmBE4nBu4WnnWicEjK4LyJNm+NXKDh27/ej1R6ztcANHn0olN3kCd+CVt+Jocx/rlEOrAlAcbl7hBAVwHH/wkHEpGxuS07dRAvY+Sha9mDGZUNCBIXSqBSIwuMXfjELJbmYLIt/iE0m3t6Z3VYxpdcQ2eHVsx42BaKcsMkJbFY5dQtZLcZ15nlfCmja7gDWhKNARazCNm/7dbapI+JaAHJXjuI5bwDm6PVlAJxqoGWToaiFskjDPJpqS6ietJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tCNxOvSZ7dfQx83Z+gpSwBDza+z/Dj56WuMUJqqOias=;
 b=cE8pEPGwv+XgxgiHCi9ocgmv3cfpkawgTztM/ftS1xfmg6+oGKSsS7EI5fm2aZOtb+8b/IM1jNdD5LPITS3f5PyK35hhKCpXsrI9Qc99vkgNHEQpv6XAaU5Ff4jd3amBjd086SGcL1qPpXlDY3FrF3rDnOvf6ITU+ObRsB628I7aW0EAfAZ7rDxFbsOCI4xtGoeZYm2pdOaS7z4+X3uY5WUyAfR4dZ7eDpPfTqjDQV0D9Zezaj7fvqQbNrm6Wi8FXQStY8kGoLFxFCWtpeUR9r0tFS601bryKBlUwAvQoxFlVxw4xnsrgntLmQqROSlRFcVbVitrlgyFRIZHAGfTNw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cisco.com; dmarc=pass action=none header.from=cisco.com;
 dkim=pass header.d=cisco.com; arc=none
Received: from CH3PR11MB8775.namprd11.prod.outlook.com (2603:10b6:610:1c7::5)
 by LV8PR11MB8558.namprd11.prod.outlook.com (2603:10b6:408:1ed::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.16; Thu, 2 Oct
 2025 23:39:11 +0000
Received: from CH3PR11MB8775.namprd11.prod.outlook.com
 ([fe80::d17a:fdd6:dfc9:19da]) by CH3PR11MB8775.namprd11.prod.outlook.com
 ([fe80::d17a:fdd6:dfc9:19da%6]) with mapi id 15.20.9160.017; Thu, 2 Oct 2025
 23:39:10 +0000
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
Date: Thu, 2 Oct 2025 23:39:10 +0000
Message-ID: <aN8NHojvtyKbX2Cs@goliath>
References: <20231110013817.2378507-1-danielwa@cisco.com>
 <20231110013817.2378507-7-danielwa@cisco.com>
 <00c11f75-7400-4b2a-9a5d-10fc62363835@intel.com> <aN7n_5oiPjk-dCyJ@goliath>
 <c8b65db3-a6cf-479d-9a83-23cbc62db1ef@intel.com> <aN7vKgcUeQgCFglQ@goliath>
 <a2be781f-96b5-47d1-81fa-b20395ca293a@intel.com>
In-Reply-To: <a2be781f-96b5-47d1-81fa-b20395ca293a@intel.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-Auto-Response-Suppress: DR, OOF, AutoReply
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH3PR11MB8775:EE_|LV8PR11MB8558:EE_
x-ms-office365-filtering-correlation-id: d0b12058-140a-4f4f-bd8c-08de020ce33a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|376014|366016|7416014|38070700021;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?hF/4q6+ByMNrTTxKxFb1mUE0c5Nt0hF20vePRbOO4EJJ/UA9/6UdQyR8v7NN?=
 =?us-ascii?Q?IMguo8BmmY3HdI++M/ngSmnzHdAYPHp8CCd/mP0LD0cg5tZcy0q2ZTNJDUO9?=
 =?us-ascii?Q?IfxAQvP3yyB5VQq08DND6uDE5qlQvJFz/Wystg4J9yG5c/b61ZTtQZo+TqbF?=
 =?us-ascii?Q?AhMC191dc5dP2RW4aXgw22FoqO9L1MmWWINRtuuemYQQUZiFoB60LuesKd9b?=
 =?us-ascii?Q?r3WqGtMgvAWOe/6ZKAG9zLsVYjAHxzxOU9t38QiTFJnzAPI4g+74Z50+aiou?=
 =?us-ascii?Q?ECYf84o59zX0yBYm/N0SVIny5FjWjKMdGn0D62tWboGz+9KBYPTxW+nC1n0q?=
 =?us-ascii?Q?5mBkfTxxZ1CF6R09F/Yp7Y2BS2C4YSejWWnNz00ZJMygj97+2J2/Iwo9oAQT?=
 =?us-ascii?Q?IEp3wIxBRdZC3NudGEC1DKojOR002u3s7O0zpxHobTDHa+sWDNGcKTyTukKK?=
 =?us-ascii?Q?eWH/VgWSfGkMiZ07InPLP02Q+nSy/RzMLw1zcsFrnpj1GRsW7+UO0G1ZybiO?=
 =?us-ascii?Q?YNs32rYCDLXOemxJk4GuOSJ528G30VO6AtG0uc/5nu4+d91016DwRiPz9H8k?=
 =?us-ascii?Q?V5vIe856RmQdsF5SHFiglF+I02wHaobe87HplAoExxn3Xj+WHhSP3X6X6GU7?=
 =?us-ascii?Q?aJ7Yjb3eCCvP7MAqyHK0z4kXENfU/JowlRFg5RcFoTm931mGKt+wdnDk5TCG?=
 =?us-ascii?Q?VYXhGbYWp0DnwzIx2BbJjFTp1utEPZTAvSORaFdPdPbi+nV6RtNnO2oghwM9?=
 =?us-ascii?Q?DP6G72nXI5aG5OpM8MI0jGh67Tom125GW2JfU65t1NWbLFrXtFwwaYO0YV88?=
 =?us-ascii?Q?EBZMD8OliGnzt949/mN4dcclWo2kSKrpPJ2IkDava18+ADkRuu/ff0V5ESEt?=
 =?us-ascii?Q?RIoZCUy9DWISLzxil4chRcKtKOxmH4G+MU8FPlpWYNYUKk6MVLXQV+7DesPV?=
 =?us-ascii?Q?Ynxfqx4EdtMq4vpd5Kd26ixMsAyJ3c76QYzkHJZMabz6z5Y9bmpv9YOir0CL?=
 =?us-ascii?Q?nGkjX3urk0A6SeUv7C+VprkKuKQ0Vv5IdW4rkfJZJjhUut+Ol9Ub/Kivj9qA?=
 =?us-ascii?Q?uzNtDlKmZkWojLpfsAhJxx8RJsjYXplMNld5LgQ/PFIXjc3AGjqbpbWEostw?=
 =?us-ascii?Q?i2ID2gjEOsbUtPaqZA70+O75BqZCZ8oacjELcTIzatZsp+XCCYq9JjgBqtUf?=
 =?us-ascii?Q?X0y0yHjSCnppSwp5tgZ+IVerMAWkbprtV+9SnpU/FHSKaVygOElzg6OsrVgu?=
 =?us-ascii?Q?2qbNucGWQ3ZvMayQAY2xZlszNH0OC/g+RFyComTX6H0QRwhNtIZhDgYyKzrw?=
 =?us-ascii?Q?nFm9ygamaybwB0idvqgcsD25jjSkL7t3Fl2lXSV3iDEDNAFTSLJWoU6pZcbE?=
 =?us-ascii?Q?XZ8zvIbSrZQbGbWVRGXn0hTnIcvEELXcbNv6M2Mllx5hSDvgtKRQk2Nx0L4h?=
 =?us-ascii?Q?tOPJlWfgldI5iUuBCHlzX9NlDrorDtjKUJn7AZmkUTaeK08JjnKrKS94vWJ7?=
 =?us-ascii?Q?FhFFA1JWCRo0fWEMwOmdTCxT1FGAILXqvcyK?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR11MB8775.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(7416014)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?bHFduCmD4VBIy4peR5HTyCYadvG61/LEqZd/bO0R6FFFB1Nq/td2IS72IzAO?=
 =?us-ascii?Q?9Bx3H2eFjDazVPNwWgtAImhAWX94wy0cxsga3JaP001ZblsXRFkBxBgNvTGk?=
 =?us-ascii?Q?VJPDWrvJoivYxgaErhDXlNyh2myHdJ67DalaUow8RfmbTdmCDrBv9p1pLWci?=
 =?us-ascii?Q?RNETNgyetUde7L7RdGmz02BtVsPdsPjZk0Tfsb6gH1fhb3K+GrfiZUQjjQ+O?=
 =?us-ascii?Q?NrS5rb0o7g+9oBan06/R79dOBemGefEvme6Sike3nDvyIUDwqp2u4U5bTB+L?=
 =?us-ascii?Q?Zx4OW7QJ1/NUoio0d8Mc7XAf5ZLf79q6CbD7CEG7WwJ8A56UU1ugLKcIgRUw?=
 =?us-ascii?Q?zaF2g24Rl7TPw+FSbm9RsRKUIbcTavHY6ETgMD3DT30KMT+/CCnxbNc/B73n?=
 =?us-ascii?Q?h3CCiujta5bdm1eT1rVGVT++r/83HoJKgfI2vmWJdJTP8taO/xvW4LXnEZV6?=
 =?us-ascii?Q?c2UKO5eF24rzKmtDQjozYriWEuEYt77iPNo1UZEnOhD/BKzJhIU9em3Ds1Ab?=
 =?us-ascii?Q?0DStWGZa373HI7qwLqBa5eFAISX69vsrNfSLyQIE97Gn/x3DV2YzZTkXyQIo?=
 =?us-ascii?Q?2QPHHBGvv0ZZVtJ8VRgX3FSWBmY5UaD0yvqXRBIrjzrKzO0aMZOKAG8m61yC?=
 =?us-ascii?Q?6+evMz4ldu4v77N3q7i/seOD2k7e8oi7iB7ZDpcPVFYDJ0HOQXeEC5u4GkBt?=
 =?us-ascii?Q?4MBXuEQkUVUF1jnYnP5HdNEYQ9fMKh/aRyHYQm+PfhSKjsORJhVUBP9ciFBq?=
 =?us-ascii?Q?F/JefGebn5MJtJc+J4I+LNGg4D4f7Po/9NeMLDFhtRo0xh8Mr06DT5Oa3Tw4?=
 =?us-ascii?Q?eMpUkvxgVRjOsLftsgz6bqLdX0xYlYltbSKlG6rAhml+tSTFWOU2IKORusrv?=
 =?us-ascii?Q?aFm3nCcgJdol+pSH6FKAvo0N8BU300iEWCVtCswADgUPx7a/9PLphvOJD9sM?=
 =?us-ascii?Q?80Su9CcTvV00W0SBQmce5N/3D12ubqe69LGUeMq1D+DI1M9byczEKjZDtgSL?=
 =?us-ascii?Q?KvJ/PilSYnBPQFvBUREGT2WJre64fBaH4skqG6NLJi5jvvvjJVUSy1NjL20J?=
 =?us-ascii?Q?999Ga9uymkHjY6tAaPPVxjapk2VzHCuc5osGdDewy6Tm5jhD7CIFfNQ8Ixsi?=
 =?us-ascii?Q?Q4pYLPXqP8NnKEZvZgiU0yiZWFqBDR9+1Yi83lrayIIT35bBet7b3tjnN9yN?=
 =?us-ascii?Q?Pe8kDW2DA5Qm9xvpK8Wnq0HqKbi0JLcKqyMxbOIO1t2V/Hl7G8zAPcUtAYyK?=
 =?us-ascii?Q?4hhXzNpeAzbxO5uePLVnO0Z1IU+KSCtHFZQJjadNviBZxe6ljY/934JkrEL5?=
 =?us-ascii?Q?/NWEbtQaGFBfWpSAV9VxLjBDrhMOIkL3bouHnQn1g/rYGtwSAKKy+xTtmASE?=
 =?us-ascii?Q?yRDH5XjZMsDVgwtwd/hBLwacnsCyLCv3ZXNWOVLVA8GrWxltEaYsgkbMgqOh?=
 =?us-ascii?Q?JFBDdgiK1TfR6bGJb/adCKvS/tKnzEGUj6fyGGwXLC6QgtfJ1/jY36JZ+hGH?=
 =?us-ascii?Q?IhHOKnGmio+BBGWZN0etNJXr1t86mtekSoHyiimHNjOVx5LP5XPGg3UebSjH?=
 =?us-ascii?Q?LqC0lKlHWMFbbK0AiUAGs/DUL3mUUGCx/1N2vFcz?=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <A6D032159117184693A583B4BBD3F49E@namprd11.prod.outlook.com>
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
X-MS-Exchange-CrossTenant-Network-Message-Id: d0b12058-140a-4f4f-bd8c-08de020ce33a
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Oct 2025 23:39:10.8193
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 5ae1af62-9505-4097-a69a-c1553ef7840e
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: /Kit0FMno4g4j7A2t6BVCbXVc8M3BDrN0Y3KQpoDwxCSlwONQdE6XB3yQW9LaV2H/FFmNZuGhTYk2FqnfGILag==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR11MB8558
X-Outbound-SMTP-Client: 173.37.147.251, alln-opgw-3.cisco.com
X-Outbound-Node: alln-l-core-03.cisco.com

On Thu, Oct 02, 2025 at 02:55:07PM -0700, Dave Hansen wrote:
> On 10/2/25 14:31, Daniel Walker (danielwa) wrote:
> ...
> >> BTW, your series looks like a *really* good idea. Please don't let it
> >> die. But you might want to trim it down a bit. I'd probably remove the
> >> tests and the 'insert-sys-cert' changes to make it more approachable t=
o
> >> folks.
> >=20
> > Since x86 is asking for it I think it would trim it down to just
> > what is needed for x86. If I don't trim down the architectures it
> > ropes in too many people anyway.
>=20
> That's not a bad idea. Or, even if you can pick two amenable
> architectures to start with it will make it really obvious that this is
> useful. Two architectures means a *lot*, IMNHO. Two is a billion times
> better than one.

ARM64 has also request this series in the past, but I don't know what their
current code looks like since my last submissions.

> > The biggest issue is that libstub would need to be modified, but
> > I've never had any luck getting the libstub maintainer to review
> > anything. I suspect he would ignore private email too, particularly
> > from people he's doesn't know.
>=20
> Are you talking about Ard?
>=20
> 	EXTENSIBLE FIRMWARE INTERFACE (EFI)
> 	M:      Ard Biesheuvel <ardb@kernel.org>
> 	L:      linux-efi@vger.kernel.org
> 	S:      Maintained
> 	...
> 	F:      drivers/firmware/efi/
> 	F:      include/linux/efi*.h

Yes I think so.

> He's a pretty nice guy and has been active in this thread, so I'm kinda
> surprised to hear you're having a hard time there. I'd just try asking
> nicely. I'm pretty sure he's "ardb" on the usual IRC networks. IRC is a
> great alternative when you're having problems getting your emails seen
> in the normal email flood.

That was the first response from him over many submissions. Which channels =
are
popular on IRC ?

> BTW, reading the changelog for libstub, it wasn't clear to me that
> changes there were _required_ for the series to go forward. For
> instance, is the x86 patch useful without libstub changes?

I think it is required because x86 can be compiled with libstub and the=20
changes take effect for the whole kernel when compiled for that architectur=
e.
libstub uses the Kconfig options directly which I modify in the series, so =
there
would need to be some compatibility changes.

Daniel=

