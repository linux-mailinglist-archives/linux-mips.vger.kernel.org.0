Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 78737421797
	for <lists+linux-mips@lfdr.de>; Mon,  4 Oct 2021 21:32:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238853AbhJDTdv (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 4 Oct 2021 15:33:51 -0400
Received: from smtprelay-out1.synopsys.com ([149.117.87.133]:57138 "EHLO
        smtprelay-out1.synopsys.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S237989AbhJDTdu (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 4 Oct 2021 15:33:50 -0400
Received: from mailhost.synopsys.com (badc-mailhost4.synopsys.com [10.192.0.82])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id DF4ADC0D86;
        Mon,  4 Oct 2021 19:31:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1633375921; bh=zEyGwsNIYA7zSFFQiPBwHWfCcgDRbAbjsD5ezQG/Wd8=;
        h=From:To:CC:Subject:Date:References:In-Reply-To:From;
        b=X2rBzLjYHJTjIwmG8mWUat2R0G6N/LET4VMhc6IVZE9vuwtyW+tCtdbgGcey7wzIo
         UhiJv6OLAMMXz7c510qxkB7CCPt4mfjozNuH7CTGcKsbVevrvXOenY8qWxHF7e3eXd
         8Ks+/Tx0qQA/nctSwHrPvjvUwE+BADo4V1sc4OZ6N9fjpyb0J/1GwEveF4zAGQOXZB
         vfw/h9tLO3iZ1+RczgIkBCf3pi3QpV3yVfPI/+tyMNFk8/EP7mlFNHLLJerXGaeZmf
         g1ocip6BmXJhk44/dtec/h3ompDI7k5dsvNN7C7FN0kFP/mssWehkkR1wEH8ihwHua
         TIT2m3HyDWYyw==
Received: from o365relay-in.synopsys.com (us03-o365relay3.synopsys.com [10.4.161.139])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (Client CN "o365relay-in.synopsys.com", Issuer "Entrust Certification Authority - L1K" (verified OK))
        by mailhost.synopsys.com (Postfix) with ESMTPS id B8290A005C;
        Mon,  4 Oct 2021 19:31:49 +0000 (UTC)
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (mail-bn1nam07lp2040.outbound.protection.outlook.com [104.47.51.40])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (verified OK))
        by o365relay-in.synopsys.com (Postfix) with ESMTPS id 892D2800BA;
        Mon,  4 Oct 2021 19:31:44 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=shahab@synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
        dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.b="LlbBKh62";
        dkim-atps=neutral
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JBM6mNNy+Y/6BAI8XrO4jRyNVMBFE7OwIsiALr8yYDwZdAokVGw278DmkdbGhIyY/k5TskDgv2tz42mzU+EKhCln4J0xyQ7snlMz8S7DNwFzWfws8rbWqtL/kIdJ1/U+jzpb0WyMtK3i2AntHDl24pwEaiDfJ3G/1Kfeb5NNSCaOE0gxvw6rxnvpzDEnkRbkq1EyePmRlezwTbhP9OKN25/GfLQmfQPIMxHNVIn+9XrRnaSQxlqcl8YMQkctwHT6bVoewZCzx7C3xdtybTFIy8buBLJdOlofyaeN25YONmi5c2z3P9MDwoux1EibDuPWnlZFsa1IQ2XuOHj76oyqLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zEyGwsNIYA7zSFFQiPBwHWfCcgDRbAbjsD5ezQG/Wd8=;
 b=AcpAlazCYq05RSc8BDyIWIyqY9zQXNmwFYdJHAGwmB3C2VYbhs8sISRZft5/qKuZpUOlws4U2RbtUYzJfsSxHQJwOWpFsNwZyBX+rJ7pY3sir9VF5bP5xg3kcXTwrVxAYVIDOOElv6By7YfxAOJ4hlUOim4u1ACmkCYuVuEqbE/3yzUNLbxd6OaBEE1KSwk412xLEBismTuCo0o/L+GqV+peH2/dAp+RIh5pFUiznLOciaLhqBlDHOa5MY01ejJ3W8aTUJv+gZkHqkInM2PidBgUvalBsst7LFqVsZxIbBTEiW7BhUWmYzmaT5vdcEuc6n1nzmpXXVgFNFEVkLt01g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zEyGwsNIYA7zSFFQiPBwHWfCcgDRbAbjsD5ezQG/Wd8=;
 b=LlbBKh62d4wkkQUTds7OIeTMrR40PlLGfN+wc53FQ0vdmjAOww6TMnPv/fsLddVqNg8jLUW9GXsfVhOH8StHkiPvT5JOoPdisbzGSAYXWzdvGXeo/0OGSfmleA5aoBvQnhocHMMgPyZfeDO7W7fY1RwbnCnbW3LYj72IVpYNtYE=
Received: from CY4PR12MB1160.namprd12.prod.outlook.com (2603:10b6:903:38::12)
 by CY4PR1201MB0006.namprd12.prod.outlook.com (2603:10b6:903:d3::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4566.22; Mon, 4 Oct
 2021 19:31:41 +0000
Received: from CY4PR12MB1160.namprd12.prod.outlook.com
 ([fe80::2d3a:44fe:fd31:11e2]) by CY4PR12MB1160.namprd12.prod.outlook.com
 ([fe80::2d3a:44fe:fd31:11e2%7]) with mapi id 15.20.4566.022; Mon, 4 Oct 2021
 19:31:41 +0000
X-SNPS-Relay: synopsys.com
From:   Shahab Vahedi <Shahab.Vahedi@synopsys.com>
To:     David Hildenbrand <david@redhat.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
CC:     Andrew Morton <akpm@linux-foundation.org>,
        Mike Rapoport <rppt@kernel.org>,
        Michal Hocko <mhocko@suse.com>,
        Oscar Salvador <osalvador@suse.de>,
        Jianyong Wu <Jianyong.Wu@arm.com>,
        "Aneesh Kumar K . V" <aneesh.kumar@linux.ibm.com>,
        Vineet Gupta <vgupta@kernel.org>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Huacai Chen <chenhuacai@kernel.org>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Heiko Carstens <hca@linux.ibm.com>,
        Vasily Gorbik <gor@linux.ibm.com>,
        Christian Borntraeger <borntraeger@de.ibm.com>,
        Eric Biederman <ebiederm@xmission.com>,
        Arnd Bergmann <arnd@arndb.de>,
        "linux-snps-arc@lists.infradead.org" 
        <linux-snps-arc@lists.infradead.org>,
        "linux-ia64@vger.kernel.org" <linux-ia64@vger.kernel.org>,
        "linux-m68k@lists.linux-m68k.org" <linux-m68k@lists.linux-m68k.org>,
        "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
        "linux-s390@vger.kernel.org" <linux-s390@vger.kernel.org>,
        "linux-mm@kvack.org" <linux-mm@kvack.org>,
        "kexec@lists.infradead.org" <kexec@lists.infradead.org>
Subject: Re: [PATCH v2 3/5] memblock: allow to specify flags with
 memblock_add_node()
Thread-Topic: [PATCH v2 3/5] memblock: allow to specify flags with
 memblock_add_node()
Thread-Index: AQHXuQNelMblMBraTEaZ+APAlAv8YKvDOx6A
Date:   Mon, 4 Oct 2021 19:31:41 +0000
Message-ID: <26257713-7e2e-f3bd-8d8e-73d664193f68@synopsys.com>
References: <20211004093605.5830-1-david@redhat.com>
 <20211004093605.5830-4-david@redhat.com>
In-Reply-To: <20211004093605.5830-4-david@redhat.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=synopsys.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 07592e0d-21b9-4a17-4791-08d9876d97cc
x-ms-traffictypediagnostic: CY4PR1201MB0006:
x-microsoft-antispam-prvs: <CY4PR1201MB0006A80A0596233B6076E9CFA6AE9@CY4PR1201MB0006.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3513;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: XKwjlCj4PYqa2u3jmoHEFu4+ysSenRlapulB4ah6RNRhBe91NYZJ9iPi1uQyeZI+pf67s6vnOCmJzmkHHi0ndVpyzo7Jrz72C7wZpNzuh7s9/KFwU+MUf63rQwD946zAhE9UIMTPMpycZfVPGA8wmcN1WuKy7UoQjxZzg8KRxgT8EIDk8bmQSaxZzpGMIK+ST2FLs3yWZU1vl4hn7kR+GV0ZtDGVYr3CiiyPk6o5QgMHKDUTlSSRQy3ukOyHRkLICHmNKGl0WP0n/J/8Uj4Lsi/hYlBTTLA2ZPgT7ENbHFed6GhLaB+YVTY9E7cl9cXb+GQfaQJ5QteKU4ynO40Huvn8IK6oVbprcfQ0GY/5jnNDYoJ0+wgNqoZOQGIMsTBUIZ9mfWqs3Y9GkCdeaHXQkPh4mUNfXBuRa8pqDDSWYpGsvC7RmVenH2c0y0a1yahFQKF1d9cMlrNqmCTvQznBFCdjGCvMem9QSPgDrmikuES89k+h92sV2OaElf3uG6jMhe+KONDRzQ2V4p+sfaJ26TwJCbBRTCK22Qtse3aiTAWxyE1DflP0teHrMhci3A7W/qnz6dxCa+yhpRbIrSLWMAEwKzyY5sVLFEJkamhOcGETyhaRWPsfs/t9r/J2MSJcNSgMYFL07xMXEY1aOQK6ZBxHpxcdT5WZNHxKs8O1u9RNLeJ+1VmX7VWZg9CgjnNX16qgsoh13eBk3knc2Jl2Ajhxq6RLM8Knpz4Q6Q0GNxzqMAPSzTMEK7T7mq8DByZX
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY4PR12MB1160.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(38070700005)(2616005)(316002)(86362001)(38100700002)(8936002)(110136005)(6506007)(8676002)(4326008)(122000001)(53546011)(71200400001)(6486002)(31696002)(36756003)(6512007)(83380400001)(2906002)(54906003)(31686004)(186003)(508600001)(66446008)(64756008)(66556008)(66476007)(66946007)(76116006)(7416002)(5660300002)(91956017)(45980500001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?WmozWlpoOWNISWhRN3JqUzZCUFRXSTZXRXB1WHFuWk5HdDU2WGxneElUOGhI?=
 =?utf-8?B?SlplaFlwSDc4dU91UUJkVndLY01FWGZrNGdOZTVpWTVzaUVaMVduWGYyNVpz?=
 =?utf-8?B?RHhGdm9IU3EzbVhTSE1aU0FWUTF3MWNCRWptWlRGVHJZM00yYkt6YWNVdm55?=
 =?utf-8?B?TksxcmhNWUZUMW9EUkd0Rk5JdkRwbGZ5eldyZlQ5TUZLU25WM1p2Yk5hSnJF?=
 =?utf-8?B?ZHZFcnlrQ0hGbmRCWm9kMDBYcmdyT0FVZEZlbTc2RFRqbEtvYk5SVkVIOTlt?=
 =?utf-8?B?WW5Jei96QkpsT1NUU2pjelJzU0JZUFU5SE84eDFNeTdROXNFTDF1Z05YTWcw?=
 =?utf-8?B?NTZyYmg4Z0JKd2draEhQZ3Q1RFJCdER5RFdEMnVHR1ZyQ2dUZExwSGgrNVh1?=
 =?utf-8?B?dWFMRUw3bDBUWncrYW1RczYyL3Jsd0pERlptVEtOeDlQUHpMMFlxdmZNbGls?=
 =?utf-8?B?SVJ2VVVXczJzdmZ2K0s4WjdYY3RnaUt2M0hLOEkrS3YyQTJkMGZEaDJ0RmJl?=
 =?utf-8?B?ZXhoYmQxR0VTNVlLUENHcTFSK2ZEZlQxb0luSGNlaENrVWZKaXBvd1N3aE5q?=
 =?utf-8?B?ZDFyaStYS2JIMU82Tkx6YUV1cUlWMm12eGNDY2cvZUs4eUlBai9QeTBBMm1u?=
 =?utf-8?B?VTJRa1V2Y1lmRkxRSGt1VWgwc2tsa25qMjNSVVIzZWRGL2FJVFh1VUF4OU5y?=
 =?utf-8?B?aTVFMWlOQkZvQnlHZyt6TXQ1aFVqS29NK1p3N2JmT05ma3lyd3BBRGpTVi9n?=
 =?utf-8?B?Ni9lTkNGNDVBU2NnRTdUWXVRbms4MFRkR2xocitsV0J6Tk40ZTBuVkQ3Mmdm?=
 =?utf-8?B?TzEwV1FhUS9PWlNoT2RQbGltV3c4WXBFdTF1VmowaFZvUEkrMnd0eTVEL3VV?=
 =?utf-8?B?NllCNXh2K1cxVEhKTlB2YUd2ZDNJZVdPYmNaZ21vbkJTclprQm5Zc1BTQzBy?=
 =?utf-8?B?ZWRJUHFxL1ZKaHNqN2IyK1ZaN1BDOFE2SkFwL2xFWUpaRXBzcDJHWXBUeWlK?=
 =?utf-8?B?S3lOVEwwWTlwUkZUa2wvb2RZSFE2TUVWSDIwNlBnWE9GYnJEazJHYUZZY1o3?=
 =?utf-8?B?bW1tQW5sVEF2bjgwTWx6czhTMUd4L3E3M00zZVdLQmxLcmxQbHRHZ1IxRVcz?=
 =?utf-8?B?eDVmbFovd255OWFySGg1V1J1ZHREUXNYWUJhSW0zT3VlMXU4azcwN0wxOFpU?=
 =?utf-8?B?TjJST1pHRW45SHFiMWxiQUJudUJSeTlIenRIYW1PakVmRnlVUUJIbmcvYzdL?=
 =?utf-8?B?WHcyNFNEckJreGJYMUVSb3RtRnVkZUltc2tMQWpxUWhURCt0anJVNGlmL1lP?=
 =?utf-8?B?ajRHQUh3bkpnQlRDRXVuVXlwOWE2dFl4OTJhc1ZqNjUwTnRsMEpiR1BaUnZo?=
 =?utf-8?B?a09STWE2L1FGTmxvYkc5NkR2U2xWZTRwNCs5U20zNEJNQkpOZ1Y0QWJIemp0?=
 =?utf-8?B?VExWMU5nTm9nNm5SbHNqTEYvWUhrMkd2V1drRDV5VTR2WVF6WnhVYWRBRkNs?=
 =?utf-8?B?R3Nna0lMRC8yNDlhL3hQZ3FuTzJzNnBiaDVUdEJRZU9pNTVVMk0wR3hqbThK?=
 =?utf-8?B?dkhYSjhIV0ZxZG1uWnhwMnpoL2RMSjE2NlQwc1Awd01uMjRqWHVZeGxxSk9k?=
 =?utf-8?B?OGRFS2ZuVTFtV0xDZ1VrbnArYlBoTnZ6aHZSVGZtME1HZldUdHd4U1dXK3B3?=
 =?utf-8?B?K2JMVzZLU1h1MDdrY0lWUm1rL3pKd2N4djRuZU95RGlqcUdvQy91MmVOREIx?=
 =?utf-8?Q?L1lM75pL4OoRSfrD+sgVdmpboQ94qbMsk5IpnDH?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <E90DB24CCA06ED4AAE9B59099C8A674B@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY4PR12MB1160.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 07592e0d-21b9-4a17-4791-08d9876d97cc
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Oct 2021 19:31:41.6088
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Ki4i9Sx92La4EjwgewKE+AMyPIXeJ74GBoaPK1rD6p4iayFa8mlSkMa8b6kFf7t7Zkl+K/3QIdS+1x3KzuRe2Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR1201MB0006
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

T24gMTAvNC8yMSAxMTozNiBBTSwgRGF2aWQgSGlsZGVuYnJhbmQgd3JvdGU6DQo+IFdlIHdhbnQg
dG8gc3BlY2lmeSBmbGFncyB3aGVuIGhvdHBsdWdnaW5nIG1lbW9yeS4gTGV0J3MgcHJlcGFyZSB0
byBwYXNzDQo+IGZsYWdzIHRvIG1lbWJsb2NrX2FkZF9ub2RlKCkgYnkgYWRqdXN0aW5nIGFsbCBl
eGlzdGluZyB1c2Vycy4NCj4gDQo+IE5vdGUgdGhhdCB3aGVuIGhvdHBsdWdnaW5nIG1lbW9yeSB0
aGUgc3lzdGVtIGlzIGFscmVhZHkgdXAgYW5kIHJ1bm5pbmcNCj4gYW5kIHdlIG1pZ2h0IGhhdmUg
Y29uY3VycmVudCBtZW1ibG9jayB1c2VyczogZm9yIGV4YW1wbGUsIHdoaWxlIHdlJ3JlDQo+IGhv
dHBsdWdnaW5nIG1lbW9yeSwga2V4ZWNfZmlsZSBjb2RlIG1pZ2h0IHNlYXJjaCBmb3Igc3VpdGFi
bGUgbWVtb3J5DQo+IHJlZ2lvbnMgdG8gcGxhY2Uga2V4ZWMgaW1hZ2VzLiBJdCdzIGltcG9ydGFu
dCB0byBhZGQgdGhlIG1lbW9yeSBkaXJlY3RseQ0KPiB0byBtZW1ibG9jayB2aWEgYSBzaW5nbGUg
Y2FsbCB3aXRoIHRoZSByaWdodCBmbGFncywgaW5zdGVhZCBvZiBhZGRpbmcgdGhlDQo+IG1lbW9y
eSBmaXJzdCBhbmQgYXBwbHkgZmxhZ3MgbGF0ZXI6IG90aGVyd2lzZSwgY29uY3VycmVudCBtZW1i
bG9jayB1c2Vycw0KPiBtaWdodCB0ZW1wb3JhcmlseSBzdHVtYmxlIG92ZXIgbWVtYmxvY2tzIHdp
dGggd3JvbmcgZmxhZ3MsIHdoaWNoIHdpbGwgYmUNCj4gaW1wb3J0YW50IGluIGEgZm9sbG93LXVw
IHBhdGNoIHRoYXQgaW50cm9kdWNlcyBhIG5ldyBmbGFnIHRvIHByb3Blcmx5DQo+IGhhbmRsZSBh
ZGRfbWVtb3J5X2RyaXZlcl9tYW5hZ2VkKCkuDQo+IA0KPiBBY2tlZC1ieTogR2VlcnQgVXl0dGVy
aG9ldmVuIDxnZWVydEBsaW51eC1tNjhrLm9yZz4NCj4gQWNrZWQtYnk6IEhlaWtvIENhcnN0ZW5z
IDxoY2FAbGludXguaWJtLmNvbT4NCj4gU2lnbmVkLW9mZi1ieTogRGF2aWQgSGlsZGVuYnJhbmQg
PGRhdmlkQHJlZGhhdC5jb20+DQo+IC0tLQ0KPiAgYXJjaC9hcmMvbW0vaW5pdC5jICAgICAgICAg
ICAgICAgfCA0ICsrLS0NCj4gIGFyY2gvaWE2NC9tbS9jb250aWcuYyAgICAgICAgICAgIHwgMiAr
LQ0KPiAgYXJjaC9pYTY0L21tL2luaXQuYyAgICAgICAgICAgICAgfCAyICstDQo+ICBhcmNoL202
OGsvbW0vbWNmbW11LmMgICAgICAgICAgICB8IDMgKystDQo+ICBhcmNoL202OGsvbW0vbW90b3Jv
bGEuYyAgICAgICAgICB8IDYgKysrKy0tDQo+ICBhcmNoL21pcHMvbG9vbmdzb242NC9pbml0LmMg
ICAgICB8IDQgKysrLQ0KPiAgYXJjaC9taXBzL3NnaS1pcDI3L2lwMjctbWVtb3J5LmMgfCAzICsr
LQ0KPiAgYXJjaC9zMzkwL2tlcm5lbC9zZXR1cC5jICAgICAgICAgfCAzICsrLQ0KPiAgaW5jbHVk
ZS9saW51eC9tZW1ibG9jay5oICAgICAgICAgfCAzICsrLQ0KPiAgaW5jbHVkZS9saW51eC9tbS5o
ICAgICAgICAgICAgICAgfCAyICstDQo+ICBtbS9tZW1ibG9jay5jICAgICAgICAgICAgICAgICAg
ICB8IDkgKysrKystLS0tDQo+ICBtbS9tZW1vcnlfaG90cGx1Zy5jICAgICAgICAgICAgICB8IDIg
Ky0NCj4gIDEyIGZpbGVzIGNoYW5nZWQsIDI2IGluc2VydGlvbnMoKyksIDE3IGRlbGV0aW9ucygt
KQ0KPiANCj4gZGlmZiAtLWdpdCBhL2FyY2gvYXJjL21tL2luaXQuYyBiL2FyY2gvYXJjL21tL2lu
aXQuYw0KPiBpbmRleCA2OTllY2YxMTk2NDEuLjExMGViNjllOWJlZSAxMDA2NDQNCj4gLS0tIGEv
YXJjaC9hcmMvbW0vaW5pdC5jDQo+ICsrKyBiL2FyY2gvYXJjL21tL2luaXQuYw0KPiBAQCAtNTks
MTMgKzU5LDEzIEBAIHZvaWQgX19pbml0IGVhcmx5X2luaXRfZHRfYWRkX21lbW9yeV9hcmNoKHU2
NCBiYXNlLCB1NjQgc2l6ZSkNCj4gIA0KPiAgCQlsb3dfbWVtX3N6ID0gc2l6ZTsNCj4gIAkJaW5f
dXNlID0gMTsNCj4gLQkJbWVtYmxvY2tfYWRkX25vZGUoYmFzZSwgc2l6ZSwgMCk7DQo+ICsJCW1l
bWJsb2NrX2FkZF9ub2RlKGJhc2UsIHNpemUsIDAsIE1FTUJMT0NLX05PTkUpOw0KPiAgCX0gZWxz
ZSB7DQo+ICAjaWZkZWYgQ09ORklHX0hJR0hNRU0NCj4gIAkJaGlnaF9tZW1fc3RhcnQgPSBiYXNl
Ow0KPiAgCQloaWdoX21lbV9zeiA9IHNpemU7DQo+ICAJCWluX3VzZSA9IDE7DQo+IC0JCW1lbWJs
b2NrX2FkZF9ub2RlKGJhc2UsIHNpemUsIDEpOw0KPiArCQltZW1ibG9ja19hZGRfbm9kZShiYXNl
LCBzaXplLCAxLCBNRU1CTE9DS19OT05FKTsNCj4gIAkJbWVtYmxvY2tfcmVzZXJ2ZShiYXNlLCBz
aXplKTsNCj4gICNlbmRpZg0KDQphcmNoL2FyYyBwYXJ0OiBBY2tlZC1ieTogU2hhaGFiIFZhaGVk
aSA8c2hhaGFiQHN5bm9wc3lzLmNvbT4NCg0KLS0gDQpTaGFoYWINCg==
