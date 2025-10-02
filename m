Return-Path: <linux-mips+bounces-11593-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id A2F09BB5793
	for <lists+linux-mips@lfdr.de>; Thu, 02 Oct 2025 23:32:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 7D9AB4E41C7
	for <lists+linux-mips@lfdr.de>; Thu,  2 Oct 2025 21:32:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7575C3BB44;
	Thu,  2 Oct 2025 21:32:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cisco.com header.i=@cisco.com header.b="RY1U1cEJ"
X-Original-To: linux-mips@vger.kernel.org
Received: from alln-iport-3.cisco.com (alln-iport-3.cisco.com [173.37.142.90])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8ADF429A1;
	Thu,  2 Oct 2025 21:32:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=173.37.142.90
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759440758; cv=fail; b=sYITOF2L4NjT80qWEDGiT6DbdCeSsACVosMcbZNR9VtWD3jRft6blpWRjTMFgRjcBIjLbYwBrhMZeRchIb6hkct8YfHRfjcW78ePz8G9COTn93DJbem74Hu0tat4KR9C8bNozAKpqUNEYUQmeJrPc1nN+Wk4LU7mfTaQ89IZdWE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759440758; c=relaxed/simple;
	bh=bywQSbdsnK3wjTLaGyYeJeg54T1tYyuSItIKQwFV1ns=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=ptQKhRkVfSNJx5XaI9TmdH4O4ohFSkhA5rjNM1LJj44CpCNMx0zIabN9+DpNQl03/2nXB8hMBZR4yeA2jn9G+pb2KzFumDhPx/sVmSxAQM/rRa36Azv6EHFAe7h5VWQdX6bkFrHnt1WUAVA3hc1IBKjHiHkUVEka7on4T+IzY+o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cisco.com; spf=pass smtp.mailfrom=cisco.com; dkim=pass (2048-bit key) header.d=cisco.com header.i=@cisco.com header.b=RY1U1cEJ; arc=fail smtp.client-ip=173.37.142.90
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cisco.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cisco.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=2005; q=dns/txt;
  s=iport01; t=1759440756; x=1760650356;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=irnWQNUaT2/00BiN/8ixg8w3gmUUj6/SZ8q8dInkuzg=;
  b=RY1U1cEJxocKM/Kv1U+4H2Fr49Mlf5L5SWCOLbF0kiyacTnn6AgvRkDf
   zr+xGImQQnFeWqJm/denms1I46MTtIIF2bxkIKL6CWDlfwOZjUhbSnemj
   clw/fnKHnJm01zby0iqU9zkPDn7Rt3o5k78atn2Aztr901A1gPnoy45ZV
   l95YJyrAP6wGd2nKyVUDBnHhFdsugD733L8VL1dQC30fDiO9qPLqzA+Fc
   5Q/XCjfAruV6Lvx0cT7/1qTgvb9rZmdvcP+k49Kd0dIg5CODJesTsRGTu
   ySPkyXyenQ7vZj8P92LERkbFu9W1d8XDXBEQxfTzngaTgjh+VE2WTyZNE
   Q==;
X-CSE-ConnectionGUID: Lcodply9TLecU3LOBuZtZg==
X-CSE-MsgGUID: 9xBnqqnrTCOVm2TnS3oT4A==
X-IPAS-Result: =?us-ascii?q?A0BXBADg7d5o/5AQJK1aHgEBCxIMQCWBIwuBblIHggUSi?=
 =?us-ascii?q?GkDhSyGVYIEHQOFeoxxiy8UgWsPAQEBDQJRBAEBhQcCjEYCJjUIDgECBAEBA?=
 =?us-ascii?q?QEDAgMBAQEBAQEBAQEBAQsBAQUBAQECAQcFgQ4ThlyGWgEBAQECARIoPwULA?=
 =?us-ascii?q?gEIGB4QECElAgQOJ4UtJgMBAqNpAYFAAooreIE0gQHgJhiBMYhRAYVshHcnG?=
 =?us-ascii?q?4FJRIQ/PoQOARIBIYZEBIIigRaKdYU8j1BSeBwDWSwBSwo1DDNtQwOBMksFN?=
 =?us-ascii?q?2gSQHeEFIQegxZygXRXQYFLGIIOcQ8GgRUZSQICAgUCQz5agRAGHAYfEgIDA?=
 =?us-ascii?q?QICOlcNgQR0AgIEgi+BEoIqD4FvA3g9NxQbBp4YQBQcPDxlBRECHpZbAbAfC?=
 =?us-ascii?q?oQcojeDcY0TmVSZBqkWAgQCBAUCEAEBBoFqATlpcHAVgyNRGQ/VNIE0AgcLA?=
 =?us-ascii?q?QEDCZNnAQE?=
IronPort-PHdr: A9a23:BDUNRh8ArcwCzP9uWBDoyV9kXcBvk6//MghQ7YIolPcSNK+i5J/le
 kfY4KYlgFzIWNDD4ulfw6rNsq/mUHAd+5vJrn0YcZJNWhNEwcUblgAtGoiEXGXwLeXhaGoxG
 8EqaQ==
IronPort-Data: A9a23:6NuXR69wwlEopxJrEmcMDrUD6H+TJUtcMsCJ2f8bNWPcYEJGY0x3m
 2oZWmzVPf+JZ2b8ftolO4u39k8B7JPcx4RnHQs4qX1EQiMRo6IpJzg2wmQcns+2BpeeJK6yx
 5xGMrEsFOhtEDmE4EzrauS9xZVF/fngbqLmD+LZMTxGSwZhSSMw4TpugOdRbrRA2bBVOCvT/
 4qiyyHjEAX9gWMtajpOs/nrRC5H5ZwehhtJ5jTSWtgT1LPuvyF9JI4SI6i3M0z5TuF8dsamR
 /zOxa2O5WjQ+REgELuNyt4XpWVTH9Y+lSDX4pZnc/DKbipq/0Te4Y5nXBYoUnq7vh3S9zxHJ
 HqhgrTrIeshFvWkdO3wyHC0GQkmVUFN0OevzXRSLaV/wmWeG0YAzcmCA2kSNooU4uJmUF1q+
 PclcxQqRA2xm9C5lefTpulE3qzPLeHiOIcZ/3UlxjbDALN+HtbIQr7B4plT2zJYasJmRKmFI
 ZFHL2MxKk2cP3WjOX9PYH46tOuhgHjydyJRgFmUvqEwpWPUyWSd1ZCwYIWFJ4zSH5k9ckCw9
 3Ls+X3gBAsmH/uhzGC59En3gdOTtHauMG4VPPjinhJwu3WXx2oOGFgVWEG9rP2RlEGzQZRcJ
 lYS9y5oqrI9nGSvT9/gT1i9oWaflgATVsAWEOAg7gyJjK3O7G6k6nMsRzpFbpki8cQxXzFvj
 gDPlNLyDjspu7qQIZ6AyoqpQfqJEXF9BUcJZDQPSk0O5NyLnW35pkinogpLeEJtsuDIJA==
IronPort-HdrOrdr: A9a23:FVoiDK7yWAUzNrmf1APXwbSCI+orL9Y04lQ7vn2ZFiYlEfBwxv
 rPoB1E737JYW4qKQ8dcLC7VJVpQRvnhPhICRF4B8btYOCUghrYEGgE1/qi/9SAIVywygcz79
 YbT0ETMqyVMbE+t7eE3ODaKadh/DDkytHUuQ629R4EJm8aCdAE0+46MHfmLqQcfng+OXNNLu
 vm2iMxnUvZRZ14VLXdOpAtZZmxm/T70LjdTVotARkh5AOSjTWuxoLbPnGjtCs2Yndk+5tn1X
 LKvTDYy8yY3s1TzCWy60bjq7Bt3PfxwNpKA8KBzuIPLC/3twqubIN9H5WfoTEcuoiUmRQXue
 iJhy1lE9V46nvXcG3wiwDqwRPc3DEn7GKn4UOEgEHkvdfySFsBeo98bMNiA1/kAngbzZdBOZ
 FwrjukXl1sfEv9dRHGlp/1vtdR5xGJSDQZ4LQuZjdkIPsjgfdq3P4iFQVuYdQ99OaQ0vF6LA
 GoZ/usucp+YBeUaWvUsXJox8HpVnMvHg2eSkxHocCN1SNK9UoJhXfw6fZv1kvozqhNAKVs9q
 DBKOBlhbtORsgZYeZ0A/oAW9K+DijITQjXOGyfLFz7HOVfUki956Lf8fEw/qWnaZYIxJw9lN
 DIV05Zr3c7fwbrBdeV1JNG/xjRSCG2XCjryMtZ+59l04eMCYbDIGmGUhQjgsGgq/IQDonSXO
 uyIotfB7v5IW7nCe9yrkTDsllpWA8jueEuy6EGsgi107f2w6XRx5jmTMo=
X-Talos-CUID: 9a23:eeD/iWF39Oe3SRn/qmJD/0kYAsQ0I0H5wXzteGufI3tbVI+aHAo=
X-Talos-MUID: =?us-ascii?q?9a23=3AGVrRfA/8kdWlREbMgVRtwD2Qf5Z4yaK3EUYXrb4?=
 =?us-ascii?q?hhczeCSpLYDCh0B3iFw=3D=3D?=
X-IronPort-Anti-Spam-Filtered: true
Received: from alln-l-core-07.cisco.com ([173.36.16.144])
  by alln-iport-3.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 02 Oct 2025 21:31:28 +0000
Received: from rcdn-opgw-4.cisco.com (rcdn-opgw-4.cisco.com [72.163.7.165])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by alln-l-core-07.cisco.com (Postfix) with ESMTPS id 56E1218000341;
	Thu,  2 Oct 2025 21:31:28 +0000 (GMT)
X-CSE-ConnectionGUID: rdKqAiqYRomyK7BgM3Vhtw==
X-CSE-MsgGUID: 30dX6JIvRrWcDkOwIsY32A==
Authentication-Results: rcdn-opgw-4.cisco.com; dkim=pass (signature verified) header.i=@cisco.com
X-IronPort-AV: E=Sophos;i="6.18,310,1751241600"; 
   d="scan'208";a="59617263"
Received: from mail-dm5pr08cu00405.outbound.protection.outlook.com (HELO DM5PR08CU004.outbound.protection.outlook.com) ([40.93.13.101])
  by rcdn-opgw-4.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 02 Oct 2025 21:31:27 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=usYSURIIOrJ0I3vLHeADTO8TPVyjVU6c+0JQNPRvResEh0lxgHgvOSJR+6V95UB+RAAv9i1Iztro7nbW4lJZWjidH6tAqG7UYVWdaAyWLHQu4edG1lqOQ6aCR10QG+C6ZvC1Ht4jWMCnUTxzm6j1m6T6W1GCb/fIEur214MJ/nlKJx4kilCaTH55/MX8FOumsYiYHu4dtmipaFebu3KqYtdrG0LbiJ52ZyQpV6bteEvteCPmnk8tLGwZYOJUPD/MRLkmdYhp+ecJJlLuKcc8e8JVQh2IAOFL2BsDRbrAqINIKWfVJIqela+hVL09yb9cMMkz2sKmNghdspDe1mgF7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=irnWQNUaT2/00BiN/8ixg8w3gmUUj6/SZ8q8dInkuzg=;
 b=k8wtp73PZ5Z42ZJ1LaAvoLfl4ZAPshouwsI3rd2OScZqFRMe/Xx4aA9FMImEExGbY8aMKLfnlQX1KqXaclKdTWP8xSq++hGa5bRWWpEA5ruTfY01dyb9BmsLlCFeI/m8My54v2Uc7DnhcQ/1mRSMpmjFPPbtT0KvNgfpIlg0R8gxCbPPiIYxPv7HXxLuUmHCy5TlD3J2KCZ+5U8pw+fqfWbS5NNZ1Mf2JaBnWd7f3N0VhhCfzVICJh94VgP+/glXoCIIXH1wL8GDik4A1qo2JXACFztOgqd2jdPo2D5kpspE0Gy5fRNGb5gzQIQYmIDpuLDn+RFsxF92yOyPegPy8Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cisco.com; dmarc=pass action=none header.from=cisco.com;
 dkim=pass header.d=cisco.com; arc=none
Received: from CH3PR11MB8775.namprd11.prod.outlook.com (2603:10b6:610:1c7::5)
 by PH8PR11MB8260.namprd11.prod.outlook.com (2603:10b6:510:1c3::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.18; Thu, 2 Oct
 2025 21:31:23 +0000
Received: from CH3PR11MB8775.namprd11.prod.outlook.com
 ([fe80::d17a:fdd6:dfc9:19da]) by CH3PR11MB8775.namprd11.prod.outlook.com
 ([fe80::d17a:fdd6:dfc9:19da%6]) with mapi id 15.20.9160.017; Thu, 2 Oct 2025
 21:31:23 +0000
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
Date: Thu, 2 Oct 2025 21:31:23 +0000
Message-ID: <aN7vKgcUeQgCFglQ@goliath>
References: <20231110013817.2378507-1-danielwa@cisco.com>
 <20231110013817.2378507-7-danielwa@cisco.com>
 <00c11f75-7400-4b2a-9a5d-10fc62363835@intel.com> <aN7n_5oiPjk-dCyJ@goliath>
 <c8b65db3-a6cf-479d-9a83-23cbc62db1ef@intel.com>
In-Reply-To: <c8b65db3-a6cf-479d-9a83-23cbc62db1ef@intel.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-Auto-Response-Suppress: DR, OOF, AutoReply
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH3PR11MB8775:EE_|PH8PR11MB8260:EE_
x-ms-office365-filtering-correlation-id: fa7a9d3f-8cf7-4515-b33d-08de01fb0910
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|366016|376014|7416014|38070700021;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?hJn26F+Hju4ErJM+hFrqxRazQTFjNeQIQB95jBX4qGXuqyX/z3QDQbiUMdLB?=
 =?us-ascii?Q?E0mcW+yvMB1s3OR8lrS7lf/Lg4t5n8admiYM8Uh9vum/+Enkl1tIbz1ZiIsa?=
 =?us-ascii?Q?BZE84sy7jTXEjeX3jR9IV8GvbDdyh0tbCzLgMw5OZ9b4UMtcNfRHY1QUiJxt?=
 =?us-ascii?Q?GxNpHTW4LztDnGVXIrOVGG4XCX2Dgvt4XugiOja3g3J9CIOqWeeN8CUUAwIt?=
 =?us-ascii?Q?8vY2gaDjAdW8VW6EG/EwGlsxGwESnzs6TNE+qTwxpnNbqK6NGjaEN6LtsvVk?=
 =?us-ascii?Q?ykBBMMxwUX8MznoVIr5+P+1UAsPT3GL5In7g+SDhAJpEPPmSLl8bgdIzty1t?=
 =?us-ascii?Q?+c1+6I9Re8vAHiy5Eb4qEK8A/xHd2X/DZ49bkfPLjaYv4f2ITSByymixYlea?=
 =?us-ascii?Q?imfk/g675e8L0/HlF6KZZeTZstn3BwymNmxRn8hIz/4AH8m01k/yd5213WT4?=
 =?us-ascii?Q?ivu2iUcHJCYVGk3BiCKNe2x0RCw94yOMXUAvkoC2sfORf2ikGgtdCApB7CR/?=
 =?us-ascii?Q?qdCNrgDXp7mjtye8UAvSSQzJf09ClXr4ZFp7bssoYLFKfUUi17OkOmcxb1k6?=
 =?us-ascii?Q?8iB38xTkOop5yqwqy+8MUuM1Q9nMz8pfvKN5XhkBDkCqqryJXma3TK5FF2QW?=
 =?us-ascii?Q?ZnJkfNv/BB8SnYwomZEaybgUhEkg8GzcX0SjA2Ezd1tRdJyas4XiDNwQcW1N?=
 =?us-ascii?Q?3FEil7laKHLUSzNNcwzBbX0ErV00kR1EoZv4I0Y0Yf5eK5t/mDQbjB/wsg6O?=
 =?us-ascii?Q?Pai6vFPHut/ZrRZU7zO2732uTMNFPN+pNlMR3SpdonIuYKC5O6gR9oJDu7aV?=
 =?us-ascii?Q?Cgbg/Xn1k9K+ugMoSV+By2JDq0vgcCUI/tdxKxQRykt1nDeeWbmLE61qRgIU?=
 =?us-ascii?Q?3aLrRFnY2T7TnfWfJLX26MAD8C6JrO8HcAtF56WR8V9c6M2yynaJdeIO+fH2?=
 =?us-ascii?Q?oDnxV09EUx1IciOd21Dci/sa9V0FT4OcSH+yyfrT/rsoI1a4z2yX0uje8i6E?=
 =?us-ascii?Q?8mmF7rsJoCDdUglOetIuQT0Ko27SpRmIN3Vxa5eMclPx+WzmS1f7sEBTvfwN?=
 =?us-ascii?Q?A79f3iSIpdp/RAvRugBiKncwZ9IvUX7eQuitbN2zRMD4HOXcY6AoMvCy+fUl?=
 =?us-ascii?Q?oHeiAedM21+7qIO6QQ8PiSbgTOOIuyaLf7b0txFVF14vJQIEmYlKa+ePeMyI?=
 =?us-ascii?Q?P0TYKsWUlXi14YRDQEmHro55INpnHQD7G9kOBr1roHuhCvcCQqMzDTbKbYYd?=
 =?us-ascii?Q?WOH1+aKSUGaaaHo1Fn2xUimjZdCbLSQpUchs4Q6CGv6Sg6KHzJY1AkGNUdnr?=
 =?us-ascii?Q?NLblD0LlCpBF749f5QQ5AvKnDlYFJNJhqJhz8FOhsszWY1WEx89ESBPRMYZF?=
 =?us-ascii?Q?ZlnYFYg3aMn8lnj90LdMlRptDYakurbNFkFGavNbKFv8xuzvuPYNext2RVww?=
 =?us-ascii?Q?88xH3tE66u2IVsgXss7h/Ju0QsfZr56oxaKggci0xGGsc6qiaZRC5HDv+oVp?=
 =?us-ascii?Q?QbLnzvzQtt1or9BilgMvG+YSXB52jLA6JqAQ?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR11MB8775.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?3qR04Q9pTrsJU1T4h0xXAuWjGCz6vH2CSmSpETA0GLcag+ME5osLWTgEJPnb?=
 =?us-ascii?Q?ucE2CrHSa0r08ohqKgHm+A35ctL3umctzBY2vT2RjuYB3O4hC926wIgWQzap?=
 =?us-ascii?Q?+sNcj2bx9ngSarDLYm2qK/TpclPEsBngwqXBbrDSksUIKleaSqmKJATCfix8?=
 =?us-ascii?Q?/vXeZwlyn8E3tQ0cxpdODK22vjsRxX9VU6w3+fIs/U14KiS7iKtoH4WPt5NH?=
 =?us-ascii?Q?nK3dwKvRPwoXabqSvPTmGlETWGLNek4hno7IMYVqu4iIuWNJpjAXTzmon98X?=
 =?us-ascii?Q?A7BNdk37mLi0H2Qs6t1WVvaaFO3YWxkFfWijBiZxv5shIeD8Z/Y756oWbJED?=
 =?us-ascii?Q?NrzSb451jRmbyL4yUXn06vThoBd94KoIfdIHRaBKSvNCX5Q5C7ppr6AoyhrO?=
 =?us-ascii?Q?Zh+vs54PBsvmsRE5ctio+lY5OdQGzx0vc/55HiEWAGSFfMIjRpp+h6xlKSui?=
 =?us-ascii?Q?9UVtdkUgttam9xGVepQbAe2cuQVucEwfEJtOJwKaw2vqCP8LK5K6COnAk7Xd?=
 =?us-ascii?Q?ZRZB0Ljo0rKlfDrCmF+rmFbMMTVHAsn7tWjOGUduSluzXpefGhk8Y9wsHFvj?=
 =?us-ascii?Q?VNprrQozSt3QnpMc5OU3KiVvRFjoUNQTIzLQtgg1a8bpVHP7vu697oFODC4G?=
 =?us-ascii?Q?0zIJtaro1EKkZ5Wu/5fKyuiC8mkp7rbkxMisLKLu45Pj9SCBLa2f0dXuqm57?=
 =?us-ascii?Q?qt77p05NRnV1By+UMuH001AkVDj38Tk+fDSfV/TqYT9Z5uQPQwQD38v/T9RL?=
 =?us-ascii?Q?QkD5gnkvaINWx89I3O3I5K+2hc4atBoH8SU/RvefLE/jh+3RScI6JMtq7/l2?=
 =?us-ascii?Q?2T5L3J/BvtAsCJYJS2E5i11bJPBNytCxcPDgN3dMFRMsR08rEeYHYxmNi2wr?=
 =?us-ascii?Q?gnzgarucJ2JDj7k06CP4EN+6+6I8MfBUqilczAkGMHNHd+vkczJ7gJZiTWKl?=
 =?us-ascii?Q?uOArHX649g1Uy1LsjZZzR4w6ubRDSQxooXEpj0zCddxSg5PhpPOh/maNxvUv?=
 =?us-ascii?Q?b+wsnbEgdhSwZWpVn79Hqrm9iM7DjcUo1mtXISFwnjJPI0eC/Es1VRA5yfot?=
 =?us-ascii?Q?VWFcwIdP19GgffMHccYP3PkBvnKJYyhhJq0oQ+c9nezJ3qKk/So7Z0YozGoH?=
 =?us-ascii?Q?zf0FNdQ0kUpQvdfcLOZY4ZKd4KOLFwhogwdqKvPZ+cOOkP33J9JygARx+4zt?=
 =?us-ascii?Q?lfr5rx8zvUjhPyFLMo/A1aMqeY6UnoTjk0ZdPtO2cSerNsbhxDBM2dBSNGQL?=
 =?us-ascii?Q?Clf4zFKMqztWXi7SV8dxw46IISNRQtx+PdqGaqxNirTXspWWS8WhNDdF79+U?=
 =?us-ascii?Q?aQKpMN2T5RFbnl5PfikKf02UjYiFpSZtGqC3hfgK7ED45wD5JA8FKOJ1+zn6?=
 =?us-ascii?Q?scO8DSTNm/6u4iITsoRRGs/ZsR0fsz4lkcPAaF5cFWGvjdQbZcP/9vdZfUUO?=
 =?us-ascii?Q?OiaOzDtSOTuITl9fmTIegQ9F5XL+DholweEgI5yeBH2IuoRFPVDCXBEO/pPm?=
 =?us-ascii?Q?d6wwIIBvDw5Fkp417A0dlR5k1tmcp0lm5EBNTM4/nw7vqwF1w1XYbkJOfTqs?=
 =?us-ascii?Q?k/yHGgnre6I2y4Tp7iyZ4ZNs8mZdCnGmrAo3zjub?=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <A71958D6FE77CB43B330CC1650803B4B@namprd11.prod.outlook.com>
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
X-MS-Exchange-CrossTenant-Network-Message-Id: fa7a9d3f-8cf7-4515-b33d-08de01fb0910
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Oct 2025 21:31:23.3083
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 5ae1af62-9505-4097-a69a-c1553ef7840e
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: UiMYda1E/AOUtDJ9+YOOZret9A/IV7Y/4JNvePGjAnle1aKEb6GoZqhhGCCSrlvrbYdlT2e21FvekI8F5ewPLQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB8260
X-Outbound-SMTP-Client: 72.163.7.165, rcdn-opgw-4.cisco.com
X-Outbound-Node: alln-l-core-07.cisco.com

On Thu, Oct 02, 2025 at 02:10:13PM -0700, Dave Hansen wrote:
> On 10/2/25 14:00, Daniel Walker (danielwa) wrote:
> >> The way I'd suggest going about getting this merged is to solicit
> >> reviews and testing from folks and then get those annotations into the
> >> patches. As it stands, this series has zero tags in addition to the So=
B
> >> tags which I assume were its authors.
> > How does one go about soliciting reviews from your perspective ? Typica=
lly I
> > just submit it in this fashion and whoever is interested reviews it.
>=20
> First, figure out who should ideally review it. Find the maintainers,
> find who's been sending patches and reviewing in the area lately. Use
> get_maintainer.pl.
>=20
> Then, ask nicely. :)
>=20
> 	"Hey x86 maintainers, I've got this series with a pretty nice =09
> 	diffstat in arch/x86. Any chance you could take a look and give
> 	an ack if you like what you see?"
>=20
> You can do that in private mails, or in a separate thread, or in a reply
> to the original series. Or, go hunt folks down on IRC.
>=20
> Just tossing the series over the wall and giving it thoughts and prayers
> usually isn't the most effective route.

I've always figured people wouldn't appreciate private emails. I guess I ca=
n try
it tho.

> BTW, your series looks like a *really* good idea. Please don't let it
> die. But you might want to trim it down a bit. I'd probably remove the
> tests and the 'insert-sys-cert' changes to make it more approachable to
> folks.

Since x86 is asking for it I think it would trim it down to just what is ne=
eded
for x86. If I don't trim down the architectures it ropes in too many people
anyway.

The biggest issue is that libstub would need to be modified, but I've never=
 had any
luck getting the libstub maintainer to review anything. I suspect he would
ignore private email too, particularly from people he's doesn't know.

I'll try re-submitting it in the manner your suggesting.

Daniel

