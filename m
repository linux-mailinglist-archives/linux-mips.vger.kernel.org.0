Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E960B54544B
	for <lists+linux-mips@lfdr.de>; Thu,  9 Jun 2022 20:41:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344826AbiFISlr (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 9 Jun 2022 14:41:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59378 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243660AbiFISlm (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 9 Jun 2022 14:41:42 -0400
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C0AC8156B7A;
        Thu,  9 Jun 2022 11:41:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1654800100; x=1686336100;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=GnJzHQEegaxYJXWZ27CRChER80Ptsc2CXjyVogRpGpo=;
  b=adpglyQbcxrhyVo9Nd85TgpcSMRxQG/MrIacJNmRC2b+NVPT0VJuLZPt
   3VFOKkDivFoHaSTzNBKyadK1g20PQoerACCtgAx7dTXvNMu9c6kGuJZAa
   sld2pcEj4bOJSJS+0TEAPJaU027QAef4G+2o0aOv9VT93l5bVdZUDZJgG
   jdXH+VCfdcdSJzgF+uZ6ko1xDFpRUr7dLD8NwKsqUQKDgc/dFoxkhQerj
   ivSgnoCJSxRpY7AqpFE/T2WX8Qa3r5boKLl1k34G2fpFAfQZKrPQ0ubod
   rOG15FvIxZHEdAnLt6Ipcax2nZLK3ohcYw6dymOSACyzqiN4GEeg6AfB2
   A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10373"; a="363709072"
X-IronPort-AV: E=Sophos;i="5.91,287,1647327600"; 
   d="scan'208";a="363709072"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jun 2022 11:41:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,287,1647327600"; 
   d="scan'208";a="671460758"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
  by FMSMGA003.fm.intel.com with ESMTP; 09 Jun 2022 11:41:39 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Thu, 9 Jun 2022 11:41:39 -0700
Received: from fmsmsx605.amr.corp.intel.com (10.18.126.85) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Thu, 9 Jun 2022 11:41:39 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx605.amr.corp.intel.com (10.18.126.85) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27 via Frontend Transport; Thu, 9 Jun 2022 11:41:39 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.174)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.27; Thu, 9 Jun 2022 11:41:38 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jhowz4NMcYZfDRxk1gWVYe3+wHE9eIcVQpUuSKHx4cQhaXs54Gd2pHVr24NZixvUBkuKWU+BF9c3k1pfGIgiTQlnqzgl9467wacIuPOYgvaYAnZH/1VGy2TQ9Q9SOFkJBIu0ZJmwy5mT4p8UTNZAMxUyKWuM3vIMHQ8CZf7N1nlYsWY60IFMvA4dmwdV5p1HN6U3XJBiMxWOfV/bQuduGqUybiwazKLRAs3ejLcL/SgCkHxvOq7hhpvcqzHY45PdEZPAGkBgRjuRjx8QZLXNXtcfCwEvNFkxdg1O4j1M4wgoZQ1zrMPpuBQZfdLm/Pn91MnS7w5ye4vKPu1hji62ZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GnJzHQEegaxYJXWZ27CRChER80Ptsc2CXjyVogRpGpo=;
 b=c677enGyhYsHlr24p2J9xfPoBg4Gs07A2Ms/ekIg09ruz0MVqNNVd3fczvTOVdJIr0Y24YDkoeI9z3bD3UEvzaHjGQkBbP30GgNNrXpIUS8FbBrCZwkzLvNizrT9K+guTfinscNubXMmcVqgfToKT5rQhqo1MKZOMjgCoJQDO/lTYy8rsSiYPzH54WGHdWUICaKRQEGjOB5NFtThjlB4o5z8SKdGVVOSZY2lkTghdc78BGMP6s4Caqp6r7Fwlbim6xeuR7w1gHjv8t1t2Rkvs2gKk3K+CmFc4JeQdJYn2v0EMLTEVo1JMbyk732EYyE684Kby+1W76CVc/j6i998zw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from MWHPR11MB1392.namprd11.prod.outlook.com (2603:10b6:300:24::14)
 by DS0PR11MB6326.namprd11.prod.outlook.com (2603:10b6:8:ce::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5332.13; Thu, 9 Jun
 2022 18:41:36 +0000
Received: from MWHPR11MB1392.namprd11.prod.outlook.com
 ([fe80::6463:8e61:8405:30f4]) by MWHPR11MB1392.namprd11.prod.outlook.com
 ([fe80::6463:8e61:8405:30f4%11]) with mapi id 15.20.5314.019; Thu, 9 Jun 2022
 18:41:36 +0000
From:   "Edgecombe, Rick P" <rick.p.edgecombe@intel.com>
To:     "hch@lst.de" <hch@lst.de>,
        "christophe.leroy@csgroup.eu" <christophe.leroy@csgroup.eu>,
        "mcgrof@kernel.org" <mcgrof@kernel.org>
CC:     "svens@linux.ibm.com" <svens@linux.ibm.com>,
        "palmer@dabbelt.com" <palmer@dabbelt.com>,
        "jpoimboe@kernel.org" <jpoimboe@kernel.org>,
        "paulus@samba.org" <paulus@samba.org>,
        "zepan@sipeed.com" <zepan@sipeed.com>,
        "iii@linux.ibm.com" <iii@linux.ibm.com>,
        "deller@gmx.de" <deller@gmx.de>,
        "aou@eecs.berkeley.edu" <aou@eecs.berkeley.edu>,
        "joey.gouly@arm.com" <joey.gouly@arm.com>,
        "anemo@mba.ocn.ne.jp" <anemo@mba.ocn.ne.jp>,
        "egorenar@linux.ibm.com" <egorenar@linux.ibm.com>,
        "ast@kernel.org" <ast@kernel.org>,
        "ardb@kernel.org" <ardb@kernel.org>,
        "mpe@ellerman.id.au" <mpe@ellerman.id.au>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
        "npiggin@gmail.com" <npiggin@gmail.com>,
        "thomas.lendacky@amd.com" <thomas.lendacky@amd.com>,
        "bp@alien8.de" <bp@alien8.de>,
        "davem@davemloft.net" <davem@davemloft.net>,
        "x86@kernel.org" <x86@kernel.org>,
        "luis.machado@linaro.org" <luis.machado@linaro.org>,
        "ebiederm@xmission.com" <ebiederm@xmission.com>,
        "mbenes@suse.cz" <mbenes@suse.cz>,
        "mingo@redhat.com" <mingo@redhat.com>,
        "jniethe5@gmail.com" <jniethe5@gmail.com>,
        "mark.rutland@arm.com" <mark.rutland@arm.com>,
        "linux@armlinux.org.uk" <linux@armlinux.org.uk>,
        "paul.walmsley@sifive.com" <paul.walmsley@sifive.com>,
        "andreyknvl@gmail.com" <andreyknvl@gmail.com>,
        "dja@axtens.net" <dja@axtens.net>,
        "liaochang1@huawei.com" <liaochang1@huawei.com>,
        "linux-modules@vger.kernel.org" <linux-modules@vger.kernel.org>,
        "huschle@linux.ibm.com" <huschle@linux.ibm.com>,
        "will@kernel.org" <will@kernel.org>,
        "akpm@linux-foundation.org" <akpm@linux-foundation.org>,
        "James.Bottomley@hansenpartnership.com" 
        <James.Bottomley@hansenpartnership.com>,
        "song@kernel.org" <song@kernel.org>,
        "guoren@kernel.org" <guoren@kernel.org>,
        "nathan@kernel.org" <nathan@kernel.org>,
        "dave.anglin@bell.net" <dave.anglin@bell.net>,
        "rostedt@goodmis.org" <rostedt@goodmis.org>,
        "atomlin@redhat.com" <atomlin@redhat.com>,
        "bristot@redhat.com" <bristot@redhat.com>,
        "naveen.n.rao@linux.ibm.com" <naveen.n.rao@linux.ibm.com>,
        "anup@brainfault.org" <anup@brainfault.org>,
        "javierm@redhat.com" <javierm@redhat.com>,
        "linux@roeck-us.net" <linux@roeck-us.net>,
        "linus.walleij@linaro.org" <linus.walleij@linaro.org>,
        "philipp.tomsich@vrull.eu" <philipp.tomsich@vrull.eu>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "ndesaulniers@google.com" <ndesaulniers@google.com>,
        "samitolvanen@google.com" <samitolvanen@google.com>,
        "yangtiezhu@loongson.cn" <yangtiezhu@loongson.cn>,
        "aneesh.kumar@linux.ibm.com" <aneesh.kumar@linux.ibm.com>,
        "geert@linux-m68k.org" <geert@linux-m68k.org>,
        "hpa@zytor.com" <hpa@zytor.com>,
        "heiko@sntech.de" <heiko@sntech.de>,
        "nathaniel@profian.com" <nathaniel@profian.com>,
        "michael.roth@amd.com" <michael.roth@amd.com>,
        "rmk+kernel@armlinux.org.uk" <rmk+kernel@armlinux.org.uk>,
        "Sakkinen, Jarkko" <jarkko@profian.com>,
        "catalin.marinas@arm.com" <catalin.marinas@arm.com>,
        "borntraeger@linux.ibm.com" <borntraeger@linux.ibm.com>,
        "dave.hansen@linux.intel.com" <dave.hansen@linux.intel.com>,
        "wangkefeng.wang@huawei.com" <wangkefeng.wang@huawei.com>,
        "tmricht@linux.ibm.com" <tmricht@linux.ibm.com>,
        "hca@linux.ibm.com" <hca@linux.ibm.com>,
        "jarkko@kernel.org" <jarkko@kernel.org>,
        "linux-parisc@vger.kernel.org" <linux-parisc@vger.kernel.org>,
        "gor@linux.ibm.com" <gor@linux.ibm.com>,
        "atishp@atishpatra.org" <atishp@atishpatra.org>,
        "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
        "dmitry.torokhov@gmail.com" <dmitry.torokhov@gmail.com>,
        "tglx@linutronix.de" <tglx@linutronix.de>,
        "kirill.shutemov@linux.intel.com" <kirill.shutemov@linux.intel.com>,
        "sparclinux@vger.kernel.org" <sparclinux@vger.kernel.org>,
        "broonie@kernel.org" <broonie@kernel.org>,
        "tsbogend@alpha.franken.de" <tsbogend@alpha.franken.de>,
        "nico@fluxnic.net" <nico@fluxnic.net>,
        "masahiroy@kernel.org" <masahiroy@kernel.org>,
        "agordeev@linux.ibm.com" <agordeev@linux.ibm.com>,
        "kernel@esmil.dk" <kernel@esmil.dk>,
        "ashimida@linux.alibaba.com" <ashimida@linux.alibaba.com>,
        "elver@google.com" <elver@google.com>,
        "keescook@chromium.org" <keescook@chromium.org>,
        "peterz@infradead.org" <peterz@infradead.org>,
        "mhiramat@kernel.org" <mhiramat@kernel.org>,
        "Keshavamurthy, Anil S" <anil.s.keshavamurthy@intel.com>,
        "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
        "chenzhongjin@huawei.com" <chenzhongjin@huawei.com>,
        "andrealmeid@igalia.com" <andrealmeid@igalia.com>,
        "changbin.du@intel.com" <changbin.du@intel.com>,
        "benh@kernel.crashing.org" <benh@kernel.crashing.org>,
        "linux-s390@vger.kernel.org" <linux-s390@vger.kernel.org>
Subject: Re: [PATCH] kprobes: Enable tracing for mololithic kernel images
Thread-Topic: [PATCH] kprobes: Enable tracing for mololithic kernel images
Thread-Index: AQHYfARLeB5VUjkE/kuMrIbBjl/m8K1HaQ6A
Date:   Thu, 9 Jun 2022 18:41:36 +0000
Message-ID: <e7dedb9086193ca7682edc10fabc4195894e5146.camel@intel.com>
References: <20220608000014.3054333-1-jarkko@profian.com>
         <CAJF2gTQgCn2CyZ4+VBqEEBT2b4+1KxoEXxrd+Ritk=58+U8EFA@mail.gmail.com>
         <YqAy0qjI4Lktk/uJ@iki.fi>
         <20220608232115.ccd4399f4a1d133e9b65c2a9@kernel.org>
         <CAPhsuW6iUieQvA6KqzSLgtxmjkVSWCuVwNA338DATb_myHxo7w@mail.gmail.com>
         <CAPhsuW6BzUtqnjvaGJScXRpghs0_V_phpdyd4_oAKhvmkX-GFw@mail.gmail.com>
         <YqEF6+YKqCHsWZJW@bombadil.infradead.org> <20220609034852.GA30873@lst.de>
         <YqH0iEgsi6+bwS3x@bombadil.infradead.org>
In-Reply-To: <YqH0iEgsi6+bwS3x@bombadil.infradead.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 27189eb0-b55c-45ab-7fe9-08da4a47aee1
x-ms-traffictypediagnostic: DS0PR11MB6326:EE_
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-microsoft-antispam-prvs: <DS0PR11MB63263E7000D819957ABD6255C9A79@DS0PR11MB6326.namprd11.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: n9qRhMXacaHR8ssVuPgZ97nSeEGIzYwgMELj+yTDV7Ybgd4Cg/Bg3QnWDsXM0f+t1AW0ckdu1103VoggfoyNpzpnsopW180u/CYYwMCnS6M/lLDSIEpK4cUDuoCPL472nYwn+koD70mp3jbvDBUo+ergZ2HrJmFKajfEZE5yJ9OCaNcdxO1elWOc2+6SLwaO/zCsmhcl/qTeQqPQvum6UG1LTD9kQBw1fWmmRFMoepQ2UMZwCpO/XetA+q/HnKFe/99tRprVIDT11HMi9tot8Z+92xNWmE25accYpKQDQCaaEvcHiSs18P5qXrEWNgbWiqxg5IAmILLVed8h/sIw49Rv0xF0QPNq/0258JmOzSEqtTOdpxrCfwBDA7qFVsAyW+T9nhr/E4r/5cbKgUzgsuyNBRneujBdSGiLcK6XcDkTrgoaqOBJr3gOZ25O5Ps3PJzy29xrf/Kn31NXqD37xVhTeMYwpIVPhAJS0wtEbWtNB9elUjAZlbbf90GTBWnR34F4AxcnGVwB6Uq6hJA4J2yU2fD78JEjxDGtjTOmCfmPrGeHgfKaKDNE2KDPuCgP98XOM/+J7nE5GpOdJDt81I/kUmI3zMUu/d2K+kG0AJThJvFfrH6xAEyGMVbQpJgptu/ww6RkbazDX3YCrIMMJvhTI0DvJlEZGkbEam8fcMEOx3PRB/BT08qETO1oPZwplkgR8oB6TpFHweYnoVMPpVwhmXjXRUqj2jXXK/Zk9Hg=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MWHPR11MB1392.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(6486002)(82960400001)(508600001)(6512007)(26005)(2906002)(38070700005)(36756003)(316002)(54906003)(122000001)(110136005)(83380400001)(66946007)(5660300002)(71200400001)(64756008)(76116006)(2616005)(66556008)(8676002)(66446008)(66476007)(7416002)(4326008)(7366002)(7336002)(8936002)(186003)(38100700002)(86362001)(7406005)(6506007)(99106002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?cHNqQ0xPdkdVYVBFSUt0K0grbmZrOEZScUpLOUdmdXFRT1hmZ21Zc3pKa2Mr?=
 =?utf-8?B?dGNLMlUwb3VQY2JsTWE1V1FtOWRFWUhVL0h3SFUxTEl0bndvb0hvNjlUdm5m?=
 =?utf-8?B?VVp3NmZjS2MvL2RIY2lSakl0WUJFVi8rZ1BZNGxUbWZBVmNudVR5elBLSUFN?=
 =?utf-8?B?RnMxa01BQWhwckNnZ003b2ppcVQ3eHVTelFHZ3BlSjdSazI4QU10SHV1UEd1?=
 =?utf-8?B?YmJLdTFWY1M2T0l5cXB0TE1ZWWRBUnlFM09qN3FaTUtMdVo4WGtVR1h3WXlT?=
 =?utf-8?B?YW1mWTRUVmVwbG5zRE5MQUVIWjRLVVluWFN5TVVZOWhkYUtjdkc5OFBkUE1S?=
 =?utf-8?B?Sm1sWTRuRVA3ajVCYS9HRE1FQUpTQUI4QVByeC9udGhzeThRZGxPbTdObjgx?=
 =?utf-8?B?N1EvSmhFdTJYRml0RVo5aTZ0dm4zZ2FvamtYSm9SSWlMMHl0NmdGVGVHaklx?=
 =?utf-8?B?UW15dFQySVlEZExpbnRabTNVYU5TNTBGMnlKUVlZdVdOdHduOFFFQTVmaWND?=
 =?utf-8?B?WXhLNFB2SkFoOXZsczZUMkROd0prdHJTNms2ZlE3VytkbWxxVzBndVNSU0Z3?=
 =?utf-8?B?eUFhcTZ2M0R6UmxPRmg0YnZnZ1BLVStkRnVSQUhMNkc3UkErOENLNGdsdFJm?=
 =?utf-8?B?N0FUeW45emorYmhkbDBsa3dlOXBLY21xclNHU3pJVm1YWmE0anVXK0hVekZP?=
 =?utf-8?B?TFdwTVNzM1NGOHY0SUZzb2sxUXgyUU9OT093SVk2Ri9xVVlNYkUxQi9IVk1S?=
 =?utf-8?B?ZndISnF6OGVmUEk0RVcrRUZjK0lLWUJIdHRKcmF5VXJPa3cwdGsvaXZsa01n?=
 =?utf-8?B?bUpieTNVd3d4M3BMN1pNdzJmMHQrN1dHbnBNZFJQWDJpalpEUjhhZm9jVlZF?=
 =?utf-8?B?b09VSVBuZklyVzI1NUZYS3NyUW1IbGRHVUF1TmpzRkNzQllVanFOZkpmQ2VC?=
 =?utf-8?B?MWY4dHVManNRdUNucCtDZjNTMFNjbjIvaDI3UFdyc3F5QTc5aTcrUkRlN2hk?=
 =?utf-8?B?NlB2KzFiVm9NUGVZZjBELzNpYVByZTBXTWpNOHdQZWxkSys1Wk1BTmZmanVN?=
 =?utf-8?B?b0Q5elY1T2lPNjd2NEpBeXp0N2owS3h2Z0RqRUJmcjlBSHZvTVI3K2xHK2py?=
 =?utf-8?B?L0NBaU1QbGZDMk14bHNTcHYrR3VydzI4MU01RG1qRS9ld3o3a1NsUWRRdGRL?=
 =?utf-8?B?N2tYcVhzT3JCTlZweDRPTTFOSXRXeW5mZDFRaEVZMjMySVV6TU1XZGJqbVJV?=
 =?utf-8?B?MCtPOFVvNDlsajlmSzByZmYzTGwvMzdvWVRiZjhPcm1MaG1vbWt0NWJOemQ4?=
 =?utf-8?B?cmZnNk9COU9CSjU2OTcwNXZGRkY3a1ZtajIxL0lOTGl2RG5oTExWeGY2UGRN?=
 =?utf-8?B?VUI5RUZtSHhFNjhoVFozVmZkeGd2R0Y1elNTOFNpUWpQZWdRUHpSdFVNL0Rv?=
 =?utf-8?B?VHZteDZhd1I3eFc4Y0o5UWUra01DMjF5ZUdsR2c5QzBPN3htanBXdEFoaDlB?=
 =?utf-8?B?S0VtNUNsRGhYbm5xTTR5VzZVQW1qSjA4T3ZIeG9CUHVSVUJ4VFBaRzJPZjFL?=
 =?utf-8?B?RDFiaWdFT0ZzYnpNUzJiUU1NSG5sVzNtUHUzeG9EOUxLQWRPSDdwNXBMUXBH?=
 =?utf-8?B?R0FQZCtTNnJEM2NkRWdvbXJKZGl3YXNSU0VqVUZ0anJrOFM1RUlvM284SXRW?=
 =?utf-8?B?bDZWK2VXWTdOYTcwR3RObUJ6WDFzMFBJNXljRXRlT0hLUjFCMlJNLzR4clIx?=
 =?utf-8?B?a1ZNMGFKampMZHg2NkUrWW9lditobGlGci93b1dKUWlhZmlZUVhnTmdpRnc5?=
 =?utf-8?B?SG5meEpXVnpQdmJVUWtTdnhKK0lkTTQ0RCtaNmlZbndWa0JYbThzNFBQMmJs?=
 =?utf-8?B?MjVPTFo1MWxzb2pWbGZCWEpteUdTVFluYWhrMHpUQUhaQWZzMUMvejM0V3h3?=
 =?utf-8?B?ODNTQmgyckcyQ3Z6aUlJSTNtOWc2L0pocGJPRElEdjZyb0gvZnBpQW94ZlVI?=
 =?utf-8?B?ZDNxNi9EVU8xdUlxeDZMTmxWcTVyUXRlVGtYekpMZHFUNzk5bWk2SmdtekxF?=
 =?utf-8?B?elVRbDBCSzZGUEhVTWZZRkE1M3FLazlyMzJPelBxQjRkYmJlN1MrNGFQa1dj?=
 =?utf-8?B?ckM1ZTdDdmljWDdIQUFhUjNZdjBCdW1GZlIydWVXQkU4MktkdGVNd201S0N3?=
 =?utf-8?B?T2pkUWl3QTArak9rVjNKQ2J3TWh5ZHBZU3M0RHFGbjZjQ1dPaHRvL2c1MWpI?=
 =?utf-8?B?T3J1bFhNdW5KN1VMUHZvWU94OGpHMkxIQ2xQSXZYRGxkVGwzV1g0U0lhQk4y?=
 =?utf-8?B?VWNIM0cwWVROcDJibW9QeDBtSEphTGpRTnd4ejQ4cGo1V0FwUmg1NmNPY0JY?=
 =?utf-8?Q?ms2JWep+TdGrPVwUiAzTkwsSDGbPXIS89nXbS?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <4BAAC4A892B18A45A2D9180E62C156E9@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MWHPR11MB1392.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 27189eb0-b55c-45ab-7fe9-08da4a47aee1
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Jun 2022 18:41:36.2868
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: dauXqRR3LKWAhInZy9JNdoGuT/+wdObAzJrkJuADQfRoEIbwZ7aYn8k7fUtHkSa98WticLLIdE1wEoby9bRvsd69SVwBmpU9uXbKzr3cUbU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB6326
X-OriginatorOrg: intel.com
X-Spam-Status: No, score=-5.6 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

T24gVGh1LCAyMDIyLTA2LTA5IGF0IDA2OjI0IC0wNzAwLCBMdWlzIENoYW1iZXJsYWluIHdyb3Rl
Og0KPiBPbiBUaHUsIEp1biAwOSwgMjAyMiBhdCAwNTo0ODo1MkFNICswMjAwLCBDaHJpc3RvcGgg
SGVsbHdpZyB3cm90ZToNCj4gPiBPbiBXZWQsIEp1biAwOCwgMjAyMiBhdCAwMToyNjoxOVBNIC0w
NzAwLCBMdWlzIENoYW1iZXJsYWluIHdyb3RlOg0KPiA+ID4gTm8sIHRoYXQgd2FzIHJlbW92ZWQg
YmVjYXVzZSBpdCBoYXMgb25seSBvbmUgdXNlci4NCj4gPiANCj4gPiBUaGF0IGlzIG9ubHkgcGFy
dCBvZiB0aGUgc3RvcnkuICBUaGUgb3RoZXIgcGFydCBpcyB0aGF0IHRoZSBvdmVyYWxsDQo+ID4g
a2VybmVsIHNpbXBseSBkb2VzIG5vdCBoYXZlIGFueSBidXNpbmVzcyBhbGxvY2F0aW5nIGV4dXRh
YmxlDQo+ID4gbWVtb3J5Lg0KPiA+IEV4ZWN1dGFibGUgbWVtb3J5IGlzIGEgdmVyeSBzcGVjaWFs
IGNvbmNlcHQgZm9yIG1vZHVsZXMgb3IgbW9kdWxlLQ0KPiA+IGxpa2UNCj4gPiBjb2RlIGxpa2Ug
a3Byb2JlcywgYW5kIHNob3VsZCBub3QgYmUgZXhwb3NlZCBhcyBhIGdlbmVyYWwgY29uY2VwdC4N
Cj4gDQo+IEl0IGlzIG5vdCBqdXN0IG1vZHVsZXMgYW5kIGtwcm9iZXMsIGl0IGlzIGFsc28gZnRy
YWNlIGFuZCBicGYgdG9vDQo+IG5vdy4NCj4gU28gd2hpbGUgaXQgc2hvdWxkIG5vdCBiZSB1c2Vk
IGV2ZXJ5d2hlcmUgY2FsbGluZyBpdCBtb2R1bGVfYWxsb2MoKQ0KPiBpcyBqdXN0IGNvbmZ1c2lu
ZyBhdCB0aGlzIHBvaW50LiBMaWtld2lzZSwgbW9kdWxlX2FsbG9jX2h1Z2UoKSBpcw0KPiBiZWlu
ZyBwcm9wb3NlZCB0b28gYW5kIEknZCByYXRoZXIgd2UgZGVhbCB3aXRoIHRoaXMgcHJvcGVybHkg
aW4NCj4gYWxpZ21lbnQNCj4gb2YgdGFraW5nIGNhcmUgb2YgdGhlIHJlbmFtZSBhcyB3ZWxsLg0K
PiANCj4gSWYgdGhlIGNvbmNlcm4gaXMgdG8gcmVzdHJpY3QgYWNjZXNzIHdlIGNhbiB1c2UgdGhl
IG1vZHVsZSBuYW1lc3BhY2UNCj4gc3R1ZmYNCj4gc28gdG8gZW5zdXJlIG9ubHkgaW50ZW5kZWQg
dXNlcnMgZ2V0IGFjY2VzcyB0byBpdC4NCg0KQlBGIGV2ZW4gaGFzIG11bHRpcGxlIHVzZXMgZm9y
IHRleHQgYWxsb2NhdGlvbi4gSXQgaGFzIGl0cyBvd24NCnRyYW1wb2xpbmUgZmVhdHVyZSB0aGF0
IHB1dHMgZGlmZmVyZW50IHR5cGUgb2YgdGV4dCBpbiB0aGUgYWxsb2NhdGlvbiwNCndpdGggaXRz
IG93biBhbGxvY2F0aW9uIHJvdXRpbmUuIEkgbG9va3MgbGlrZSB0aGVyZSBhcmUgZXZlbiBtb3Jl
DQpsaXR0bGUgYWxsb2NhdG9ycyBpbiB0aGVyZS4NCg0KU28geWVhLCB0aGVyZSBzZWVtcyB0byBi
ZSBhIGxvdCBvZiB0aGUga2VybmVsIGluIHRoZSBidXNpbmVzcyBvZg0KZHluYW1pY2FsbHkgZ2Vu
ZXJhdGVkIHRleHQsIGZvciBiZXR0ZXIgb3Igd29yc2UuIEkgYWdyZWUgdGhhdCBpdCBuZWVkcw0K
dG8gYmUgZG9uZSBjYXJlZnVsbHkuIEhvd2V2ZXIsIHRoZXNlIHVzYWdlcyBhbHdheXMgc2VlbSB0
byBoYXZlIHRoZQ0Kc2FtZSBwcm9ibGVtcyAoV15YLCBhcmNoIGVjY2VudHJpY2l0aWVzLCBldGMp
LiBTbyBJIGRvbid0IHRoaW5rIHdlDQpzaG91bGQgaGlkZSBhd2F5IHRoZSBwaWVjZXMuIEluc3Rl
YWQgd2Ugc2hvdWxkIGhhdmUgc29tZXRoaW5nIHdpdGgNCmd1YXJkIHJhaWxzIG9uIGl0LCBzbyB0
aGV5IGNhbid0IGdldCB0aGUgYWxsb2NhdGlvbiBwYXJ0IHdyb25nLg0KDQpCdXQgSSBndWVzcyB0
aGUgcXVlc3Rpb24gaGVyZSBpczogd2hhdCBzaG91bGQgd2UgZG8gaW4gdGhlIG1lYW50aW1lPyBJ
dA0KaXMga2luZCBvZiBzaW1pbGFyIHRvIHRoZSBxdWVzdGlvbnMgdGhhdCBjYW1lIHVwIGFyb3Vu
ZCB0aGUgYnBmIHByb2cNCnBhY2sgYWxsb2NhdG9yLiBTaG91bGQgd2UgaG9sZCB1cCBhbGxvY2F0
b3IgcmVsYXRlZCB3b3JrIHVudGlsDQp1bmRlcmx5aW5nIHByb2JsZW1zIGFyZSByZXNvbHZlZCBh
bmQgdGhlcmUgaXMgc29tZSBtYXR1cmUgY29yZQ0Kc29sdXRpb24/DQoNClBlcnNvbmFsbHkgSSBo
YWQgdGhvdWdodCB3ZSB3b3VsZCBuZWVkIHRvIGRvIHNvbWUgY2xlYW4gc3dpdGNoIHRvIGENCm11
Y2ggZGlmZmVyZW50IGludGVyZmFjZS4gSSBzdGlsbCB0aGluayBzb21lZGF5IGl0IHdpbGwgYmUg
cmVxdWlyZWQsDQpidXQgaXQgc2VlbXMgdG8gYmUgZXZvbHZpbmcgbmF0dXJhbGx5IGZvciB0aGUg
dGltZSBiZWluZy4NCg0KTGlrZSBzYXkgZm9yIGEgbmV4dCBzdGVwIHdlIG1vdmVkIHByb2cgcGFj
ayBvdXQgb2YgYnBmIGludG8gY29yZSBjb2RlLA0KZ2F2ZSBpdCBpdCdzIG93biBjb3B5IG9mIG1v
ZHVsZV9hbGxvYygpLCBhbmQgdGhlbiBtYWRlIGtwcm9iZXMgdXNlIGl0Lg0KVGhlbiB3ZSB3b3Vs
ZCBoYXZlIHNvbWV0aGluZyB3aXRoIGltcHJvdmVkIFdeWCBndWFyZCByYWlscywgYW5kIGtwcm9i
ZXMNCndvdWxkIG5vdCBkZXBlbmQgb24gbW9kdWxlcyBhbnltb3JlLiBJIHRoaW5rIG1heWJlIGl0
J3MgYSBzdGVwIGluIHRoZQ0KcmlnaHQgZGlyZWN0aW9uLCBldmVuIGlmIGl0J3Mgbm90IHBlcmZl
Y3QuDQo=
