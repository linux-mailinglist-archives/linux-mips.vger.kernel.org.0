Return-Path: <linux-mips+bounces-15646-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id gnc6H4MET2qGZAIAu9opvQ
	(envelope-from <linux-mips+bounces-15646-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Thu, 09 Jul 2026 04:16:35 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id DC61672BE53
	for <lists+linux-mips@lfdr.de>; Thu, 09 Jul 2026 04:16:34 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=Nvidia.com header.s=selector2 header.b=bHZcwpI+;
	dmarc=pass (policy=reject) header.from=nvidia.com;
	spf=pass (mail.lfdr.de: domain of "linux-mips+bounces-15646-lists+linux-mips=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-mips+bounces-15646-lists+linux-mips=lfdr.de@vger.kernel.org";
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id E79F5302F776
	for <lists+linux-mips@lfdr.de>; Thu,  9 Jul 2026 02:16:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0CE6D2F362B;
	Thu,  9 Jul 2026 02:16:33 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from CY7PR03CU001.outbound.protection.outlook.com (mail-westcentralusazon11010054.outbound.protection.outlook.com [40.93.198.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85D8F43935A;
	Thu,  9 Jul 2026 02:16:31 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783563392; cv=fail; b=KocH3u4XYG7Xa7ppsu/qbGoeVzTNLtaiSYoOIAEysAsJtqcxAan8dw12Ef/I7EzRBSk/0lrhNrbu6BoWvWi4BwJweLet23JQ7LlPSZ96geGF+vk4E7s+LE7GTSfkok0vqNf0fPUcA9XuyEijJisFxyZDaNXcifmRMtgIZ8n5lh4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783563392; c=relaxed/simple;
	bh=mQOz/vZwpptLml9ngUiHtnIijO07N34uT3jjODapIYM=;
	h=Content-Type:Date:Message-Id:Subject:Cc:To:From:References:
	 In-Reply-To:MIME-Version; b=W5XkUxumOJpIQyDzXzXcWYNGSxIY93/C1vt6+VjSa66QqFtRwgiJknAY+S02jQstsWs08DdWIWbQdmjE7Y2Cb0+43TzQNKMAg5eAYS9JhkqzXJqXQYVpVq2PhmAlxgJTFL9fNpjdZD5dsMbDioOiWS880kfxGJZ4S8dkLVZe8Hk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=bHZcwpI+; arc=fail smtp.client-ip=40.93.198.54
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eyOSMQU34qH0irxWvkoLCDtGZ1UCOv2FP3TIdkjUL6cIIZtMLmFfcEWXWEVVl5pDhuoMLWReyRQ34KJ289gUJboS65RfFwpQFbDONEK7Qrvo3aG2QxPPEgNf0SN92NddEMkSaL1H8myAs97QQUySCLlGcmy9JaesSCv1XG9BpxgJTHOY+UuQtQxj4lg6wrSnNTR7Ekj+nuoge+zx9UPaWKWeSUfYAlDNcMlU2zF/N3yhXbzFgoESWAge8YoqPnHo7ZDXucGz+AscVZLszduKu+wJVqOOh5HpggvyuZXXdbcGpRuxW8q+X0ezM4Snx9DlznIc+AjrJuxlmuZL5AQTzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=S5i5qm0dl3MCZSJwPGMqY2iZ6ROLBDxLPpqAztLM+CY=;
 b=bCHPR/RV8Gj9GMyEp5oUg7KmQ6qWmkgAwwa3lEJItGaV9dlvmY0OMoRpRX5gO2vvSaOmvaQUYnowRrecLHt+ZpKMbaXyowcecIjejbrF3kHp10exaqHBKvvvoiUgCxYzgJ2pb5gT3I6/z0Qojgwp1bkCk5qVTqsmMbzsqDomYMbefSEhKN5K+3lFWwN3zs6gWhPMJ6ZjwqHgO1zcQwujOI7ADbqypKLqe40y31UQSxp52YsHxQDrRzhRw8AuZeBWfPOiYUhlE/3PNqJ4qclHJ9tBe2DXnOJiKsiuVZZ0AmvjmgiGgaGCMM9egI6Cd5jJDiwyVuJweVs0M/4w1v1Ppw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=S5i5qm0dl3MCZSJwPGMqY2iZ6ROLBDxLPpqAztLM+CY=;
 b=bHZcwpI+S11ZA79kzFiR6KGkaKIsT9myHkoayB68XrDPMByjx6QnyFUnvtfYGw/WgWy+dJ1OO5pLHDCD2nTo6Bxt/TMGvqLintLXWoDmOgQdRIhefaRUvEpCjL8O/TTSfKz4sV2H9AfMeNr97oteFBgQlM/6zqD3QOEhMskwqx4jprhi9Hf9Z2M81SRZnZ+6CDLxMnzxPHcvaaPIMce+a/3aT7FGv02bonp5re6kXvpUAs86v/oidBI27IBLU/8b2RfFe64yRz13IqXQkh4GU4en4WCM39YM17NaFvdLSyioEeeD2CV0KVullxNRdHEX8juZLvRxXtc2U4KJZJESLQ==
Received: from DS7PR12MB8371.namprd12.prod.outlook.com (2603:10b6:8:e9::18) by
 DS3PR12MB999242.namprd12.prod.outlook.com (2603:10b6:8:38d::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.8; Thu, 9 Jul 2026
 02:16:21 +0000
Received: from DS7PR12MB8371.namprd12.prod.outlook.com
 ([fe80::23d7:9e07:1de8:d80a]) by DS7PR12MB8371.namprd12.prod.outlook.com
 ([fe80::23d7:9e07:1de8:d80a%3]) with mapi id 15.21.0181.009; Thu, 9 Jul 2026
 02:16:20 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 08 Jul 2026 22:16:15 -0400
Message-Id: <DJTOG7IBZKEE.87TLWNXOCHR8@nvidia.com>
Subject: Re: [PATCH 12/13] mm/mprotect: convert mprotect code to use
 vma_flags_t
Cc: <akpm@linux-foundation.org>, <tsbogend@alpha.franken.de>,
 <maddy@linux.ibm.com>, <mpe@ellerman.id.au>,
 <maarten.lankhorst@linux.intel.com>, <mripard@kernel.org>,
 <tzimmermann@suse.de>, <airlied@gmail.com>, <simona@ffwll.ch>,
 <l.stach@pengutronix.de>, <inki.dae@samsung.com>, <sw0312.kim@samsung.com>,
 <kyungmin.park@samsung.com>, <krzk@kernel.org>, <peter.griffin@linaro.org>,
 <jani.nikula@linux.intel.com>, <joonas.lahtinen@linux.intel.com>,
 <rodrigo.vivi@intel.com>, <tursulin@ursulin.net>,
 <robin.clark@oss.qualcomm.com>, <lumag@kernel.org>, <lyude@redhat.com>,
 <dakr@kernel.org>, <tomi.valkeinen@ideasonboard.com>, <hjc@rock-chips.com>,
 <heiko@sntech.de>, <andy.yan@rock-chips.com>, <thierry.reding@kernel.org>,
 <mperttunen@nvidia.com>, <jonathanh@nvidia.com>, <kraxel@redhat.com>,
 <dmitry.osipenko@collabora.com>, <zack.rusin@broadcom.com>,
 <matthew.brost@intel.com>, <thomas.hellstrom@linux.intel.com>,
 <oleksandr_andrushchenko@epam.com>, <deller@gmx.de>, <bcrl@kvack.org>,
 <viro@zeniv.linux.org.uk>, <brauner@kernel.org>, <muchun.song@linux.dev>,
 <osalvador@suse.de>, <david@kernel.org>, <baolin.wang@linux.alibaba.com>,
 <liam@infradead.org>, <npache@redhat.com>, <ryan.roberts@arm.com>,
 <dev.jain@arm.com>, <baohua@kernel.org>, <hughd@google.com>,
 <vbabka@kernel.org>, <rppt@kernel.org>, <surenb@google.com>,
 <mhocko@suse.com>, <jannh@google.com>, <pfalcato@suse.de>,
 <kees@kernel.org>, <perex@perex.cz>, <tiwai@suse.com>,
 <linux-mips@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linuxppc-dev@lists.ozlabs.org>, <dri-devel@lists.freedesktop.org>,
 <etnaviv@lists.freedesktop.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-samsung-soc@vger.kernel.org>, <intel-gfx@lists.freedesktop.org>,
 <linux-arm-msm@vger.kernel.org>, <freedreno@lists.freedesktop.org>,
 <nouveau@lists.freedesktop.org>, <linux-rockchip@lists.infradead.org>,
 <linux-tegra@vger.kernel.org>, <virtualization@lists.linux.dev>,
 <intel-xe@lists.freedesktop.org>, <xen-devel@lists.xenproject.org>,
 <linux-fbdev@vger.kernel.org>, <linux-aio@kvack.org>,
 <linux-fsdevel@vger.kernel.org>, <linux-mm@kvack.org>,
 <linux-sound@vger.kernel.org>
To: "Lorenzo Stoakes" <ljs@kernel.org>, "Lance Yang" <lance.yang@linux.dev>
From: "Zi Yan" <ziy@nvidia.com>
X-Mailer: aerc 0.21.0
References: <7ef626d8a12dc742cfc09d080be5dc09850e873a.1782760670.git.ljs@kernel.org> <20260701160917.91435-1-lance.yang@linux.dev> <akaIfhfbTCAdJm3H@lucifer>
In-Reply-To: <akaIfhfbTCAdJm3H@lucifer>
X-ClientProxiedBy: BN9PR03CA0752.namprd03.prod.outlook.com
 (2603:10b6:408:13a::7) To DS7PR12MB8371.namprd12.prod.outlook.com
 (2603:10b6:8:e9::18)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR12MB8371:EE_|DS3PR12MB999242:EE_
X-MS-Office365-Filtering-Correlation-Id: 5e8ab397-c07f-4023-39b8-08dedd601114
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|1800799024|366016|7416014|6133799003|18002099003|22082099003|4143699003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info:
	uLHBbUaaBCio1ECS4YGmLrkocaWbvY5KMdUTJuW+iZD+ln0gcG2SL4i83FiYZObHQSD+WaX2bMzf6wX4TJuG7XeyC+ir6a0tIfy5As3gt613qbccdPXzF6hm9uqDD66zHs3/g1JsMYbZJpZOmk4i0uW1JgvlJ/NZw+ZRTk6u8gFzM3PSv0ek6RB2GQp3JnaRzN/z6s/lnmZnjESGE85LitccMeCSQPuPu85KN6w0CCyd0BwV4NogNxdlVXF7+9wZZCJGUvlJj6E9xSYxOeanOA9YCxDmKXnGkyLXCIO4wmBRUYm1C1QgOqHC3zv0LtnMWRuGtNkY8RXJzdZsOlZ19c7yLmmjd9zSAZHmj0UBOtLmkIYCpL7A4RVRyr/eg/9hMZUzuDTrZFROsQC77xul60Vt0FGMoiYt+woGcPFt2w+SZvW340KkNFE/JscKGfTgu5dCEErHoQLROdyFIql+JdjNqJyHOEPufGGVaeWm38nEhtD2Pqfng1ltXYVuEenwDiKCMGCjnHIpVzBvPM4X3Vxqyu6ruxe7io1c3izyYc4bzwny2Q8ZrLTCrOelubkCmRsqrjvzIa1vEmxvfVhg69fF9sxCpbbFJ/MOuLter66YJYEKbrgLdXruRujkrOPdkE6GmKdq9IwLYVVYuTwwK7N5NQR7ZdWob5icuN6/T5Q=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR12MB8371.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(1800799024)(366016)(7416014)(6133799003)(18002099003)(22082099003)(4143699003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NkZpV3dyVnhsamsxbkV0UHhoMndkRGhwdTFUbk1saVpJbmc4d0FwaVZPSGlU?=
 =?utf-8?B?VWZvcm5FK1h3dlAyNlNYUFhNdWhVSjE3WVpHUWw1TnFkSWVlVDI4eU5McHVu?=
 =?utf-8?B?dW5wR2t6dEQyNVZacTM1aW92VWNXdHFrdExDc1hSNE53YUJmMTVqQUJJdG56?=
 =?utf-8?B?UnVFZ1A1YmsrOVU0Y2JzbWswUnd1UHgzZnE5THE0V2haUElhYjBnWHQyNDZT?=
 =?utf-8?B?aXZ4Ukp1cXlVTEkwRWZ6T29Bd0lxMUUreXBFZnJjbFVseWp1a003Tk8vbWRU?=
 =?utf-8?B?L0UzK2ZNWjZiQlVad2ZDRmw2MEFSc0hOejMzMjNRWUxoam9QS1J2OWgyYXJt?=
 =?utf-8?B?NTUyUDRKNlVXWXZESnpQZDRWYTFJM1RFZ05DOXJ0a0JFKzUyQ25qWTAxQno1?=
 =?utf-8?B?T2V0MDZ5TUE4dFJQdXBYNmQwY09lVlM2MkhiMDZnRGh0TkN3YSswRjRJMnll?=
 =?utf-8?B?VzRyaG5YaFhQUm9QemFTODVaSXgyMzBzUFA3Q2l6Z2VUQzZPc2cvd3VXMmZH?=
 =?utf-8?B?SkVYMEJkTVBYR054QTdjVWZmVVJObVZUbmVaR1VqMFpyMUxqd2s1TW83MU5s?=
 =?utf-8?B?YXJ6aTYyV1J3QmpLNnFBMVhLNGpiS1h1eW5za0pUZ0pabVVac21pL3VKdjVl?=
 =?utf-8?B?YmRGaFBTc2J6Y3VjbTl6RlpvZHcxbE9lUnFpSC9uc0pVTFNKZFdkN1ZQcUd1?=
 =?utf-8?B?M1BjK2ZnNURIRVMzWFNONDFicWRudy9PSWVra3BXM3I2OEhpazA1enUxbVRk?=
 =?utf-8?B?dW5DNE1LUjMrcE1tTVh6dHN5bngzTU5FSHF2ZE9FTytWN1hPTEpvTWt3WVBN?=
 =?utf-8?B?WGtyV1BFK25qUTVWM281S21aNVIvaGMrdXVIcUhlcWhUSm9oYmJYOS83bDlX?=
 =?utf-8?B?NHhSSzdQdjh3VE5rNGhWajBFczg3bnFkTDBhU0tWTUQ3R3ZTMWFNb0VZN0R4?=
 =?utf-8?B?OUgra1c4Uys3aytWQXZ2T3dFako1WjJUTmV6TlhMMERWeGtidHBWSW5ZWDFQ?=
 =?utf-8?B?NnlKL0tzUW9ET1dJRGc5bDdDWmQvdDdxaDJtZXFuVzR3VVNwK2VEdmhnMTFZ?=
 =?utf-8?B?OGtGbFdkSitIMUZxQlBCTFhBWnRPeG5sMG5DcFZWdG9ISEhSWTJxRjU5M0tk?=
 =?utf-8?B?OGN6cUV5cVJ2QWJCYXBuMW1ocTlxMDNYcnloUC85RXJZMkFraGwxMCtBTy93?=
 =?utf-8?B?bGpVYWJndGIyYkQ0QWZodjgvc3A0RC9pNzM1MzBac0p2NHVFTS90SUtOSGJ3?=
 =?utf-8?B?VDNlYWVkTHMvL0JTZXJOU2I5ZDRqTVJWUFQvTXlscjEzak1ZRFBUbHJkdS82?=
 =?utf-8?B?amNqRkhxZGhvTzA3TzVZbityRWVvTTNhQWREdzgzQ1pJcVozNWR3VkVsa3l2?=
 =?utf-8?B?Zi9abWlXUjIxUWNReTFqRzJFbmJ1S0IweHpvUXBIQlREWEY5RnlWeDZTNExU?=
 =?utf-8?B?QUhBSWwxcjFoR3JRcTR3WUE4dm1ZaXRITk00VVV1Nm15aUVFdWR3eWw5eVFC?=
 =?utf-8?B?SEZOdm1KZjNFeW5kTG90VUNpWU5oR0xhK09Dd3pSMzV4K3VUd3g0OThYeWo3?=
 =?utf-8?B?Nm8wYTBJdzVsYVNnendQNUFBUHdHNmtaQ1pQVytiNHhTYVBaZis5SFhtVlRz?=
 =?utf-8?B?cTFxQit0VFZFOW4wYXZ0cWw2TXFFV1pLVGZIenpQSnpPc1FwZEFKUWt5VlRY?=
 =?utf-8?B?cndDOVZEajUvYUkwVXZDdlQvbm14dW14dVlGWTVNdzlMejhXZHMzNGoxRzJx?=
 =?utf-8?B?TmV5S2xoYm1vRllTZWFmc3N6NHAxOWtZUGppZlpQSXNTaG5KazdVOXdHRFpR?=
 =?utf-8?B?QnFKWitvTkQ1REpJU2Z0MytyM1Nab3NWaWNITWdGT1pSaFBlMUhLWDNEdXQ2?=
 =?utf-8?B?R081Z2txc1k3VlRvQkovVGgrL1FNYzZ2OFlFQVpCVDlVYWoyVlZHb1VxUUJ2?=
 =?utf-8?B?K3RUL05FVi8vQ2NTcTU1K3E3Si93bWZMWmtjTnAzNnVva0RlQ1ZkbWx2bVFy?=
 =?utf-8?B?V1RQOEFDZUh3bzZicHNRV0VVREl1NllCVEVZbmtyWWVkZThrM0xYY3F4V0d5?=
 =?utf-8?B?SEVSTnBCTHhMS2E4MW5yUlA2bW4rTjNldWprOGxRVkZleDdXQWlxTFRQZTcr?=
 =?utf-8?B?MCtXakh2dVNhWUhzOEFYR2xSaUhxSFJNNWVTajRLaVF6d2pyMFJxQTNJMnZ0?=
 =?utf-8?B?ZmJrMXh2L0d1akIwOEd4ek1qUlVHaTlTbWJUdHRHRW1SL1ZFOGdUeDZHdExC?=
 =?utf-8?B?c0x3R1FUcjNUVTZxTG1ubUlrcENtSHdvOFUycWNHdUtTVG1aZmdZSlcrSzhX?=
 =?utf-8?Q?2q6tPecz5MPiwDuOas?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5e8ab397-c07f-4023-39b8-08dedd601114
X-MS-Exchange-CrossTenant-AuthSource: DS7PR12MB8371.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jul 2026 02:16:20.8381
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tHgqFQVrabgr4tGpUQdTwGC4hTzqDSs3VNvEPC+iKs+7SVolHHj+RkZB5IyLfnTx
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS3PR12MB999242
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-7.16 / 15.00];
	WHITELIST_DMARC(-7.00)[nvidia.com:D:+];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[nvidia.com,reject];
	R_DKIM_ALLOW(-0.20)[Nvidia.com:s=selector2];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[linux-foundation.org,alpha.franken.de,linux.ibm.com,ellerman.id.au,linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,pengutronix.de,samsung.com,linaro.org,intel.com,ursulin.net,oss.qualcomm.com,redhat.com,ideasonboard.com,rock-chips.com,sntech.de,nvidia.com,collabora.com,broadcom.com,epam.com,gmx.de,kvack.org,zeniv.linux.org.uk,linux.dev,linux.alibaba.com,infradead.org,arm.com,google.com,suse.com,perex.cz,vger.kernel.org,lists.ozlabs.org,lists.freedesktop.org,lists.infradead.org,lists.linux.dev,lists.xenproject.org];
	TAGGED_FROM(0.00)[bounces-15646-lists,linux-mips=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[ziy@nvidia.com,linux-mips@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:akpm@linux-foundation.org,m:tsbogend@alpha.franken.de,m:maddy@linux.ibm.com,m:mpe@ellerman.id.au,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:l.stach@pengutronix.de,m:inki.dae@samsung.com,m:sw0312.kim@samsung.com,m:kyungmin.park@samsung.com,m:krzk@kernel.org,m:peter.griffin@linaro.org,m:jani.nikula@linux.intel.com,m:joonas.lahtinen@linux.intel.com,m:rodrigo.vivi@intel.com,m:tursulin@ursulin.net,m:robin.clark@oss.qualcomm.com,m:lumag@kernel.org,m:lyude@redhat.com,m:dakr@kernel.org,m:tomi.valkeinen@ideasonboard.com,m:hjc@rock-chips.com,m:heiko@sntech.de,m:andy.yan@rock-chips.com,m:thierry.reding@kernel.org,m:mperttunen@nvidia.com,m:jonathanh@nvidia.com,m:kraxel@redhat.com,m:dmitry.osipenko@collabora.com,m:zack.rusin@broadcom.com,m:matthew.brost@intel.com,m:thomas.hellstrom@linux.intel.com,m:oleksandr_andrushchenko@epam.com,m:deller@gmx.de,m:bcrl@kvack.org,m:viro@zeniv.linux.org.uk,m:bra
 uner@kernel.org,m:muchun.song@linux.dev,m:osalvador@suse.de,m:david@kernel.org,m:baolin.wang@linux.alibaba.com,m:liam@infradead.org,m:npache@redhat.com,m:ryan.roberts@arm.com,m:dev.jain@arm.com,m:baohua@kernel.org,m:hughd@google.com,m:vbabka@kernel.org,m:rppt@kernel.org,m:surenb@google.com,m:mhocko@suse.com,m:jannh@google.com,m:pfalcato@suse.de,m:kees@kernel.org,m:perex@perex.cz,m:tiwai@suse.com,m:linux-mips@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linuxppc-dev@lists.ozlabs.org,m:dri-devel@lists.freedesktop.org,m:etnaviv@lists.freedesktop.org,m:linux-arm-kernel@lists.infradead.org,m:linux-samsung-soc@vger.kernel.org,m:intel-gfx@lists.freedesktop.org,m:linux-arm-msm@vger.kernel.org,m:freedreno@lists.freedesktop.org,m:nouveau@lists.freedesktop.org,m:linux-rockchip@lists.infradead.org,m:linux-tegra@vger.kernel.org,m:virtualization@lists.linux.dev,m:intel-xe@lists.freedesktop.org,m:xen-devel@lists.xenproject.org,m:linux-fbdev@vger.kernel.org,m:linux-aio@kvack.org,m:linux-fsdevel
 @vger.kernel.org,m:linux-mm@kvack.org,m:linux-sound@vger.kernel.org,m:ljs@kernel.org,m:lance.yang@linux.dev,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[Nvidia.com:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ziy@nvidia.com,linux-mips@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_GT_50(0.00)[82];
	MID_RHS_MATCH_FROM(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-mips];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,nvidia.com:mid,nvidia.com:from_mime,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,Nvidia.com:dkim]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: DC61672BE53

On Thu Jul 2, 2026 at 11:53 AM EDT, Lorenzo Stoakes wrote:
> On Thu, Jul 02, 2026 at 12:09:17AM +0800, Lance Yang wrote:
>>
>> On Mon, Jun 29, 2026 at 08:25:35PM +0100, Lorenzo Stoakes wrote:
>> >Replace use of the legacy vm_flags_t flags with vma_flags_t values
>> >throughout the mprotect logic.
>> >
>> >Note that we retain the legacy vm_flags_t bit shifting code in
>> >do_mprotect_key(), deferring a vma_flags_t approach to this for the tim=
e
>> >being.
>> >
>> >Additionally update comments to reflect the changes to be consistent.
>> >
>> >No functional change intended.
>> >
>> >Signed-off-by: Lorenzo Stoakes <ljs@kernel.org>
>> >---
>> > mm/mprotect.c | 16 ++++++++--------
>> > 1 file changed, 8 insertions(+), 8 deletions(-)
>> >
>> >diff --git a/mm/mprotect.c b/mm/mprotect.c
>> >index 9cbf932b028c..c9504b2a2525 100644
>> >--- a/mm/mprotect.c
>> >+++ b/mm/mprotect.c
>> >@@ -40,7 +40,7 @@
>> >
>> > static bool maybe_change_pte_writable(struct vm_area_struct *vma, pte_=
t pte)
>> > {
>> >-	if (WARN_ON_ONCE(!(vma->vm_flags & VM_WRITE)))
>> >+	if (WARN_ON_ONCE(!vma_test(vma, VMA_WRITE_BIT)))
>> > 		return false;
>> >
>> > 	/* Don't touch entries that are not even readable. */
>> >@@ -97,7 +97,7 @@ static bool can_change_shared_pte_writable(struct vm_=
area_struct *vma,
>> > bool can_change_pte_writable(struct vm_area_struct *vma, unsigned long=
 addr,
>> > 			     pte_t pte)
>> > {
>> >-	if (!(vma->vm_flags & VM_SHARED))
>> >+	if (!vma_test(vma, VMA_SHARED_BIT))
>> > 		return can_change_private_pte_writable(vma, addr, pte);
>> >
>> > 	return can_change_shared_pte_writable(vma, pte);
>> >@@ -194,7 +194,7 @@ static __always_inline void set_write_prot_commit_f=
lush_ptes(struct vm_area_stru
>> > {
>> > 	bool set_write;
>> >
>> >-	if (vma->vm_flags & VM_SHARED) {
>> >+	if (vma_test(vma, VMA_SHARED_BIT)) {
>> > 		set_write =3D can_change_shared_pte_writable(vma, ptent);
>> > 		prot_commit_flush_ptes(vma, addr, ptep, oldpte, ptent, nr_ptes,
>> > 				       /* idx =3D */ 0, set_write, tlb);
>> >@@ -811,8 +811,8 @@ mprotect_fixup(struct vma_iterator *vmi, struct mmu=
_gather *tlb,
>> > 		vm_unacct_memory(nrpages);
>> >
>> > 	/*
>> >-	 * Private VM_LOCKED VMA becoming writable: trigger COW to avoid majo=
r
>> >-	 * fault on access.
>> >+	 * Private VMA_LOCKED_BIT VMA becoming writable: trigger COW to avoid
>> >+	 * major fault on access.
>> > 	 */
>> > 	if (vma_flags_test(&new_vma_flags, VMA_WRITE_BIT) &&
>> > 	    vma_flags_test(&old_vma_flags, VMA_LOCKED_BIT) &&
>> >@@ -886,7 +886,7 @@ static int do_mprotect_pkey(unsigned long start, si=
ze_t len,
>> > 			goto out;
>> > 		start =3D vma->vm_start;
>> > 		error =3D -EINVAL;
>> >-		if (!(vma->vm_flags & VM_GROWSDOWN))
>> >+		if (!vma_test(vma, VMA_GROWSDOWN_BIT))
>> > 			goto out;
>> > 	} else {
>> > 		if (vma->vm_start > start)
>> >@@ -894,7 +894,7 @@ static int do_mprotect_pkey(unsigned long start, si=
ze_t len,
>> > 		if (unlikely(grows & PROT_GROWSUP)) {
>> > 			end =3D vma->vm_end;
>> > 			error =3D -EINVAL;
>> >-			if (!(vma->vm_flags & VM_GROWSUP))
>> >+			if (!vma_test(vma, VMA_GROWSUP_BIT))
>>
>> IIUC, should this be
>>
>> if (!vma_test_single_mask(vma, VMA_GROWSUP))
>>
>> instead?
>>
>> #elif defined(CONFIG_PARISC)
>> #define VM_GROWSUP	INIT_VM_FLAG(GROWSUP)
>> ...
>> #ifndef VM_GROWSUP
>> #define VM_GROWSUP	VM_NONE
>> ...
>>
>> VM_GROWSUP is only defined as GROWSUP on parisc and becomes VM_NONE
>> elsewhere. But VMA_GROWSUP_BIT is the raw ARCH_1 bit, which is also used
>> for other arch-specific VMA flags:
>>
>> 	DECLARE_VMA_BIT_ALIAS(SAO, ARCH_1),		/* Strong Access Ordering (powerpc=
) */
>> 	DECLARE_VMA_BIT_ALIAS(GROWSUP, ARCH_1),		/* parisc */
>> 	DECLARE_VMA_BIT_ALIAS(SPARC_ADI, ARCH_1),	/* sparc64 */
>> 	DECLARE_VMA_BIT_ALIAS(ARM64_BTI, ARCH_1),	/* arm64 */
>> 	DECLARE_VMA_BIT_ALIAS(ARCH_CLEAR, ARCH_1),	/* sparc64, arm64 */
>> 	DECLARE_VMA_BIT_ALIAS(MAPPED_COPY, ARCH_1),	/* !CONFIG_MMU */
>>
>> Other vma_test() changes look fine to me: just fixed INIT_VM_FLAG()
>> masks matching their VMA_*_BIT :)
>
> Thanks you're right, will fix!
>
> Again I swear I ran claude on all of this so it's failing me here :)
>

Is it better to add something like below to avoid misuse these mutually
exclusive bit aliases?

An example for VMA_GROWSUP_BIT:

#if defined(CONFIG_PARISC)
DECLARE_VMA_BIT_ALIAS(GROWSUP, ARCH_1),		/* parisc */
#else
/* make VMA_GROWSUP_BIT a build bug on */
#endif

Hmm, these VMA_*_BIT are enum items, so the above might not be possible.
An alternative is to only define them for the corresponding config and
you will get build errors when trying to use them directly and the
config is not enabled. Otherwise, misuses like "vma_test(vma,
VMA_GROWSUP_BIT)" is harder to uncover.


--=20
Best Regards,
Yan, Zi


