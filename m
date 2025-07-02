Return-Path: <linux-mips+bounces-9616-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 189E1AF6034
	for <lists+linux-mips@lfdr.de>; Wed,  2 Jul 2025 19:40:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BC00E3B02FC
	for <lists+linux-mips@lfdr.de>; Wed,  2 Jul 2025 17:39:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3B7FE2D781F;
	Wed,  2 Jul 2025 17:40:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="Sf3Ybm1u";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="pgU3CqXu"
X-Original-To: linux-mips@vger.kernel.org
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07180253358;
	Wed,  2 Jul 2025 17:40:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751478017; cv=fail; b=s+JROnfmE13HWvLx1FgkDUCIhKWYciagLFEaHoBZqaxCyJo5RDj4GFckB1S1uCysh541V4EoG8rhD9bCz9KtKphPAgk3Wvz5vLjtjer802kgiamCYdfWh0nU2qUwja204iA4/Zpqso3HrmCw/mXuAgbg8/6nzkxAuCjq/YNwRl0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751478017; c=relaxed/simple;
	bh=VYOPqt3C2eR7sIY3Buzg2N81gikQImj0G4AzXgTdllc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=IBkXJrY8CrPA47q/bmimJQRq+NMwewDwV2npmOOr1XLFt8YdVJ1Te+wUPLyd1FA5l3JwTiLKpL0PhXqRHzEU6IPGCirO7u74+o3DWLHKfJtciBAT4vn22I+mxPEAKRuTAqp8/YHKWXqkFVtvNaAhGkTAG/T2stpKsQKNdiYvWjg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=Sf3Ybm1u; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=pgU3CqXu; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 562HMdCO009002;
	Wed, 2 Jul 2025 17:39:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=02Yu0lXATwJshyzmFv
	aYiqnGiBOfpHICzNAHXDtrc9Y=; b=Sf3Ybm1uqJYz0UMBioOTbVLPOvWM0+73Ew
	2HMa9y5mQPO777hkfUtzMIueBVeAtROYw4tK4R00q53JL3Gy+9/GjkV2BoU6szFr
	gYFJgHVLRiyGzwAZGLQLBTrYYBcX65rZSP215LRZaL2RBpkArSeACb/t6bx3gewO
	Qt4kWn4C47YNRLrMZu//dE6vM92nHDEtxtMLtZaTV3qCUMqrBghtSm2/pXKGStDl
	YtwSzu7wk6OV2kZB3jxbeRmM4xXN9foM/KZYHNeKFYFgvCQUx0Ch4bspGY0YUlQR
	2rxhp/b2aben8jrg8VSMz1ujJikFTT4Qm/x23ZBmXUI3btvEsQiw==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 47j8xx7efn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 02 Jul 2025 17:39:53 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 562H3BOR030283;
	Wed, 2 Jul 2025 17:39:52 GMT
Received: from nam10-mw2-obe.outbound.protection.outlook.com (mail-mw2nam10on2054.outbound.protection.outlook.com [40.107.94.54])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 47j6ubjtm6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 02 Jul 2025 17:39:51 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dT/Zrw1FIafrTa3emyfAZkO4aF6CIJyEPft+5pcp7I2G+FPkDBROzWtd0JSzz/l0zlNcEPlklE8KIpGWx7qJVYq7PBVzDPjXLqEFMbNg9mlvfwmaPJd2wpliaV+mTA243T37zL+PEWWJ4PgMveGYON4botxeP/yszxPfQkM+lhyJss3UXwnsgKoBBoySZR6pqZhadN8RhlR6GYNVcGyrqC3pIpIeRz1PSjmL5CEwd95SVPU4AZ5qNn/5Qy6BghB/zy3fjLLlyfbPM4ibl00Tv5cP9nQoXKjSctYX7L5sT+8PXsxICoRmvWbp5kod504KLxoQDMeo91P+5MmAZgyYeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=02Yu0lXATwJshyzmFvaYiqnGiBOfpHICzNAHXDtrc9Y=;
 b=xVSZanWV7H1vMKNZRPQaVYbj1x+DG8GDqbZV3I8u0g37rAsYnhP081w80UOXcDk25aaQhK1Rl3G2vMO/P5XnKf38giFPQDg7sJnIoJfF5s3+T7txuODi+fb5e8kqhKdXG4PI1LGDEwEgzspbRP//LblTpfKdNxaSvEw/r3efc2N+YPFPLDYkwZbX46mlP6kfoz5XoNt9aVsAMXawiyBFGfPM5kL/47kEYrlS+km0lJOVVIwnabtKTO+N0naN2e6zILwCeOrzRzhOGKhKJW1kZrHOnH9qbLaKueqUm47i1yBtQ+DzcPa3GT/V15kJ8MMX1/HXCl6fBIiCndtOjpHfwQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=02Yu0lXATwJshyzmFvaYiqnGiBOfpHICzNAHXDtrc9Y=;
 b=pgU3CqXu3MCH7XnZ+/6vj7ioWr3w7DnXqwJIXj0d17m0wEjh0QfVnWl/Fdbmb1d+taLRkYVmZKzJd1hYjHwGRacImJWMn6U8AXjidrEBHsfC+2jKEFz8n7CHw4xj5KIulr7WFaRxTkG+aZZZrkJnQ0KBzZixT4uB8m3BADvJaRA=
Received: from PH0PR10MB5777.namprd10.prod.outlook.com (2603:10b6:510:128::16)
 by CH0PR10MB4827.namprd10.prod.outlook.com (2603:10b6:610:df::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.32; Wed, 2 Jul
 2025 17:39:49 +0000
Received: from PH0PR10MB5777.namprd10.prod.outlook.com
 ([fe80::75a8:21cc:f343:f68c]) by PH0PR10MB5777.namprd10.prod.outlook.com
 ([fe80::75a8:21cc:f343:f68c%6]) with mapi id 15.20.8880.015; Wed, 2 Jul 2025
 17:39:49 +0000
Date: Wed, 2 Jul 2025 13:39:33 -0400
From: "Liam R. Howlett" <Liam.Howlett@oracle.com>
To: Peter Xu <peterx@redhat.com>
Cc: linux-kernel@vger.kernel.org, linux-mm@kvack.org,
        Andrew Morton <akpm@linux-foundation.org>,
        Huacai Chen <chenhuacai@kernel.org>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Muchun Song <muchun.song@linux.dev>,
        Oscar Salvador <osalvador@suse.de>, loongarch@lists.linux.dev,
        linux-mips@vger.kernel.org, Jason Gunthorpe <jgg@nvidia.com>,
        David Hildenbrand <david@redhat.com>
Subject: Re: [PATCH] mm/hugetlb: Remove prepare_hugepage_range()
Message-ID: <g4odcoaq4sf3iubkole75bvq5ezfg7bjvd7ritfwbekzl4sxi5@p4q7i3jfvapw>
Mail-Followup-To: "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
	Peter Xu <peterx@redhat.com>, linux-kernel@vger.kernel.org, linux-mm@kvack.org, 
	Andrew Morton <akpm@linux-foundation.org>, Huacai Chen <chenhuacai@kernel.org>, 
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Muchun Song <muchun.song@linux.dev>, 
	Oscar Salvador <osalvador@suse.de>, loongarch@lists.linux.dev, linux-mips@vger.kernel.org, 
	Jason Gunthorpe <jgg@nvidia.com>, David Hildenbrand <david@redhat.com>
References: <20250627160707.2124580-1-peterx@redhat.com>
 <jjwzfnbz7uzuniwd2qc6prfg4sboa7dnjswnbeotjbaqngbs6s@2y42bsqcjpv6>
 <aGVqRQKWu9IDVwk6@x1.local>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aGVqRQKWu9IDVwk6@x1.local>
User-Agent: NeoMutt/20250510
X-ClientProxiedBy: YT3PR01CA0133.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:83::10) To PH0PR10MB5777.namprd10.prod.outlook.com
 (2603:10b6:510:128::16)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR10MB5777:EE_|CH0PR10MB4827:EE_
X-MS-Office365-Filtering-Correlation-Id: 0fa1012b-3560-456b-5cc1-08ddb98f714f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|1800799024|366016|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?QnNnJDkMM1RXkAnVtAba+TMacKLuEkOAL+a9N7etH3xLyIRRNrJ5iVshg0UO?=
 =?us-ascii?Q?cMXt7miQ7FzLVyOIbJL6cySHc/2W9cxHbSo3yM4GThu63pnTsVjxK3oZkKDo?=
 =?us-ascii?Q?Wp1oXksqGMSHW0XsVEP8Wfm9nQWWgODZITv6afzIX+r5OZFXTxt7P1HCbbKi?=
 =?us-ascii?Q?cZVS+CdqEvUUyIFToTBtC4mmPEIZqtBerai7O4ENqk25dSwbCMBTKwqqB/YP?=
 =?us-ascii?Q?erXlx3s+ojvhOCkRPQ4kJV9WePNZoc6pjHu7lQwYlk0IYMVgXFCvVO4ZZkbG?=
 =?us-ascii?Q?rKGlCusyEUbkzyEyeLtKodxJyWnnpDAw571bkhrywiCqXrVrUbCtnI3B/lg3?=
 =?us-ascii?Q?7X9z4vDSKbtqIkV4fd9MMqg3IjiHC467Yso8XOfwceikvO7IsOnxw1Ho7/do?=
 =?us-ascii?Q?jvk152jpmadWjImT8EeIYxkzvYIacrHoGOT+ijStE21TnnezcrL8q4XgCBz9?=
 =?us-ascii?Q?Zi6v7/lcq0Xw7eq6Ke1+1+r/J54Bze7k3yLvpzh68765wODSZHTbKRpAhnPX?=
 =?us-ascii?Q?knLe9mMCzJMqsjAsx08nVXGGyRvq+BWs9sm5TOZj+Ituhe7zao+j4Ul6ydln?=
 =?us-ascii?Q?f/cKvQuJnK7wqkZtWIck2gdf0N/bPz3O7oQCftDXOubZOxg4gm843/9dAe18?=
 =?us-ascii?Q?MYgC+Omm+iuC0LyD3NNCnHM7xDLATw/O93+315C6U/1Sq5XYZ62hLL6Hpjdl?=
 =?us-ascii?Q?urghU/DRxA6X1Xr2saMZxp08ft9WAbQbDuYYzU9IzLIfmp1PkOpjPdgRjPYS?=
 =?us-ascii?Q?vxJE5AUBx3WUlQO9m1Z8exp27JEC9/y/1wYBB235KJkWVpDfFqzYflFqHmo0?=
 =?us-ascii?Q?l33nGsXN9GsQNZ6I2ap8vWfdSTNuj7j0c0GyI130Mh5AR8ol+yJOpXbBqTKa?=
 =?us-ascii?Q?yk4jWbBZDN22xvtE8QIZ6GlSu0k16E074KW81x2qTAh+RCbgKmc6ZbW7LBpy?=
 =?us-ascii?Q?wBvWd7BWoubl9zqVdmz5Q3wX57ADkbX7U/R/W7ixoxrsiSNMx3ZUqv1jUL4C?=
 =?us-ascii?Q?MIfOmVzWVP4KPKOKGXTA/47YZ+Ju/+qp2MUTKZXq196quG1BaDSw+ShAN+pZ?=
 =?us-ascii?Q?dvsLav01m1djHazVhoVe7Jvu0TwSVEiJMj6vq72lPjR4vr+kpacWUZfgw14J?=
 =?us-ascii?Q?2oQ1X1jvbgU2aUlHYZjUV4QHJ5OIRPncevZWEx837jpMh2PHhoDxLfcZ0j/3?=
 =?us-ascii?Q?sIcoo5E0QSBmxSTMa3MePG5iWT1ThHnxJSwp+Dd5pTmGPaxOAF6xC6Jhxt3z?=
 =?us-ascii?Q?GbzLLd9/rWQzfsFH2qYOx8qpKfDM1RWqJg8LRImQ8x89vtWAG9gF8KXix/bZ?=
 =?us-ascii?Q?dmoLMWODYdhRlUKaZ0ZTrqnPL/6xarYwhHC9HneZi23krdi0fApDjmND7rrz?=
 =?us-ascii?Q?HeYRmEgOdOQD++VGay50btSKclrTEvL52nztZJuvQb9FGR9rTkfn1u2FqH33?=
 =?us-ascii?Q?FHJq65RoGkQ=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR10MB5777.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?9TRSzkff6Dvjt/fkSPl5Q2WbQT7P7E6Tq4Ot31/pvLKkQlJhdeIiZfRA3GPN?=
 =?us-ascii?Q?qkqFiv4OUuvomsbzPh0k7cTyuKpZQUyFokxgqy5DSrqb7R6jjOyY0exSOQJR?=
 =?us-ascii?Q?V3xDKOXY/Ni13xLZhJsDZV5FFXJl13OROPNOpPvzVjMLtsIjf0GEUIUPviKk?=
 =?us-ascii?Q?ldJ3hXr8YtcB1ibDLKwEdIsO5n4i1TUVc3JB+MbI5xoYiTEreBc93Y0cl00K?=
 =?us-ascii?Q?azGnn19HYdxPZna3jTK7FkMZ5YqsuL/g2LHuPMrZqUHhAb+u9YeMA67y3+A1?=
 =?us-ascii?Q?lWGEZ94bRYXtrxnLZo/LkmE0Va4erhgVI7TKzdDm7xGEXym6LfmMjDZlaKAo?=
 =?us-ascii?Q?QaTfCk/r6eAOOVf1FUKhlcGE5TfsVzA7z4uFs/o4rZe0NnheZQt8mGTiUXsL?=
 =?us-ascii?Q?MOQzjbGOlXOMA7uQWTo9ZcWJdVulj9Dp6lU//lFUw+r1Yhhj3HR9Y85OXOCO?=
 =?us-ascii?Q?uNS0jFt98uvt9XWOgsimiA9HtjbeHu4K1QjR6BlJeu4rc2MprA5iQMrZeziE?=
 =?us-ascii?Q?sDLicFmnvnc4EDRobWrI27SZ4WNVK2IOS9ZefQzn+ADXXXt0KfPZ9u7ByZuo?=
 =?us-ascii?Q?T4txc8QZVY4fjE9tRywXB1r+LeVSVZWD3iSyrrdY1FHinCnCw51oO6w3ZK7i?=
 =?us-ascii?Q?CsuDHc1EH0tPwgkOY7V1aYrEB86ePiFRcpBmqFP3/orjDCxIfX0dZ0DmQ7be?=
 =?us-ascii?Q?TjevLtARITUReqh8ba5Xpj9wjIlZAajkRDzqzzFKMA7hJHx0PoKTu2vpjGsF?=
 =?us-ascii?Q?zsqttO7LM7x5q4FmV5Nu3RfATFEtVmjZ0Kzcy7gYSimwsd0RlE4whW1zL9fD?=
 =?us-ascii?Q?TGIghlhO3unEHQ24BrtBDmnVVMs74mL673K36YB3yJiofG4+U15i9OLcVT0z?=
 =?us-ascii?Q?Nh/FJku2tp30rNgL1eHpjphLx7TH/I+1sjLOmM4dLW6MQTbfXd4D2HNS1OOP?=
 =?us-ascii?Q?Va9sODU4hMJ+RgnQOaPg7YKXLSyaJ6DjseGqRAPAJLlzBuwhXsDqhqsdqodp?=
 =?us-ascii?Q?sI6Ec0criBp32PgnU+93gLKEvRh/J8xdGzsIY56tGDbYkRmqukOzohWbckUG?=
 =?us-ascii?Q?yVXGHVC6VePU5dPDSx4OXQyDsFfrJwWO2z51MaELm+Wnt5b4wu4dMl0RRlS9?=
 =?us-ascii?Q?eKMYNt9aLirqRAjvaR0x6g3Bu80MDZaSAO7q9pf1IzpTzArSDT2BP2QHc7vE?=
 =?us-ascii?Q?rSb1DcA2kdoCBZNn80P4pBNukarlh4Svty2LmgZOZMQcra6Iv/9H2QNvB2lg?=
 =?us-ascii?Q?afZlRrs/NLLgQZqhnasMxqXojlK606alT3A6cTRHGxLmDv8CqxDEJqsBIe4A?=
 =?us-ascii?Q?2ApoLOUCA7c/Ftd+D1TfpeQpZ06vZFlLiOXeP9mDtfnTZNjdjJlZRVMgnTw2?=
 =?us-ascii?Q?Q3j0XujEIBUY6vM/lh3/cVBoxqKhjMf6H3ruq45zsI2nCxB3z0RfvIsJOSwC?=
 =?us-ascii?Q?zbsLxXkS/00AbPGxNlsl+EeBVW6wvB8WzIQMnYODSSBc7U4tnWYILOaATkvD?=
 =?us-ascii?Q?t2Dyp/h6Op0qU9YVqjxpLOy5VYvWMDcvbQzkhokCSxNOZWQkB1yK5NdcpaF9?=
 =?us-ascii?Q?B8iazTCjBJiuIqRs6Aj6pipshwyZLOjYJtyiKDcN?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	rvUSb6MMHUP4Yfpys2u16XByDrKbO/zzIy30msKqVpl5l31KyoUi7R43w00wDzCvdzDqH2F5HweXl2D7gPS1huydCepx3CAoAfg8N14v6hT4j4yvtxx9Wt8mP58k+UXM6gyvd1XU8A9LkAI8XXkq2m+aj8tldNDaC3GKgIbFFdlc4JFBKK2eJdY7WVIFLOgnBjiMDaJCj8e0Y2FrQMesAxxIN4gACLO8nrpwR/gD/rIu4jqC0rPpZ1NXPgziOkH2bUq7BteHFWu77lL7I1mE+95MTZH2CNzgWavaJe1R/ZwMkSxR5iOxTtZ073QfDnNIyxk0LMgsGVq+VAYG8EbaY4eRrLwrwdeU3AZmT89bQ2rvV6Oy89FEObIcL2yFHArmpPHg52ramsElbxRSKBSEZ4vYWBBgGeg7sjnK0xYAaPrceG6gyQDd03x3QAZoACpF1zkVfNHGBl19lXZJ4B8ZUSkFWKYjmxlGIJnZr/kNRMzsoHwH6TFVx7ZDNhaK+g3mCeRs+yFmDbbqZ/9pRVPm9a7C3/uNluIGd5P+ba6MaTTLwTunx9AgnTxOVHSXa3PyCWHYOEde8tN0EsDsgStYiS1MixQPTaIhdFgLN46RFmI=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0fa1012b-3560-456b-5cc1-08ddb98f714f
X-MS-Exchange-CrossTenant-AuthSource: PH0PR10MB5777.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jul 2025 17:39:49.0405
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Rn+Nn6qZbdbTHxGJabVeMrOlKJGobjbvJHHp8uP0uOSl8vLCz3Wbn8p4lxD9IiToE3T7wchzjhbbFgt/lhIV8g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR10MB4827
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-02_02,2025-07-02_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 spamscore=0 suspectscore=0
 phishscore=0 mlxlogscore=999 mlxscore=0 adultscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2505160000
 definitions=main-2507020145
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzAyMDE0NSBTYWx0ZWRfX7wuZKGpjgsVX ACExhHz7OhxdYgVArROc9xx2EDAU/ypq4qYIxEei5VJ1nVR6S2J3YJVwXsGh3oDcPjv524MLIjT ZGpkzG4fGH3XS/hYcXqbHNv0hQ8oiZLZq0dnKWtVZzA+8Bd0TgBeQpJ2bp2HJAXa8khWGVR8wtL
 n9ow4UXSPKi7hRG+saSHfEIXNXWfBNEzP06z+YmZIRkaUPZEHJU9BEDWbF8PffxaSEGy4J4+lau rJ+CVFGE0NSfY4J8FGiNqnUhm8PyYAWW0M5jO9Fn+5VsQx6+P6lFxdJpLLiperwffgZA9VUq8wZ PB5AnueVX22bks50GJT32Ek130/+l5DxUVqOw3Otx5XOxu7dxNafGI5BFcZJWiphBMNyTOH/miG
 ojtmBvDIrVQRXiULf8p3rozSJhwjV6XOqZhxhL285mscXCgIZxqFDWBnSq3b1yqfGMFhRk0+
X-Proofpoint-ORIG-GUID: N0X2Chu58B7JKdU06379iw5MDjEabBa6
X-Proofpoint-GUID: N0X2Chu58B7JKdU06379iw5MDjEabBa6
X-Authority-Analysis: v=2.4 cv=QfRmvtbv c=1 sm=1 tr=0 ts=68656ee9 b=1 cx=c_pps a=e1sVV491RgrpLwSTMOnk8w==:117 a=e1sVV491RgrpLwSTMOnk8w==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=Wb1JkmetP80A:10 a=GoEa3M9JfhUA:10 a=20KFwNOVAAAA:8 a=z7EgdADxH4MY0LAmeswA:9 a=CjuIK1q_8ugA:10 cc=ntf awl=host:14723

* Peter Xu <peterx@redhat.com> [250702 13:20]:
> On Mon, Jun 30, 2025 at 10:26:13AM -0400, Liam R. Howlett wrote:
> > * Peter Xu <peterx@redhat.com> [250627 12:07]:
> > > Only mips and loongarch implemented this API, however what it does was
> > > checking against stack overflow for either len or addr.  That's already
> > > done in arch's arch_get_unmapped_area*() functions, even though it may not
> > > be 100% identical checks.
> > > 
> > > For example, for both of the architectures, there will be a trivial
> > > difference on how stack top was defined.  The old code uses STACK_TOP which
> > > may be slightly smaller than TASK_SIZE on either of them, but the hope is
> > > that shouldn't be a problem.
> > > 
> > > It means the whole API is pretty much obsolete at least now, remove it
> > > completely.
> > 
> > Thanks for rewording this change, apologies for the late response on
> > your change log.  I think it's fine.
> 
> That's totally OK, thanks for keeping an eye.
> 
> > 
> > I think the only meaningful difference is that the failure would have
> > aborted entirely if stack_top - len < addr, but with this change it will
> > attempt to search in the opposite direction.  Unless I missed something?
> 
> IIUC the prepare_hugepage_range() API shouldn't affect the direction of VA
> allocation yet, but rather a (likely proven unnecessary by this patch) way
> to fail fast for hugetlbfs for no good reason.
> 
> It is currently only invoked with MAP_FIXED, and if it returns 0 it'll
> further move on to the core VA allocator.  Then the allocation can happen
> either TOP->DOWN or DOWN->TOP.
> 
> So "stack_top - len < addr" check is meaningful no matter if MMF_TOPDOWN or
> not, because we want to make sure it won't overflow in any direction.  It's
> just that it's already covered at least by the two archs providing this
> hugetlbfs specific hook.

What I meant was, before your change the failure would happen before the
we get to the core VA allocator, so the reverse direction would never
happen.

If this is only used with MAP_FIXED, then I don't think it matters as
many tests are skipped anyways.  It might be worth mentioning that the
MAP_FIXED flag is checked in different orders based on the arch, again I
think this change resulted from forked archs cloning the code and
keeping up to date.

Thanks,
Liam

