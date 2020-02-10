Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A5728158496
	for <lists+linux-mips@lfdr.de>; Mon, 10 Feb 2020 22:13:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727056AbgBJVNH (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 10 Feb 2020 16:13:07 -0500
Received: from rcdn-iport-4.cisco.com ([173.37.86.75]:62314 "EHLO
        rcdn-iport-4.cisco.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727003AbgBJVNG (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 10 Feb 2020 16:13:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=cisco.com; i=@cisco.com; l=3676; q=dns/txt; s=iport;
  t=1581369183; x=1582578783;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=W6PkRRNBCYAzKgtJMwVghFzfcseydpZ9fCt2CCDs+m4=;
  b=MvKAmzFMpAcvw9LBi5Iwr2mEzTKvkP+/lq+ooMwZW7Iceyy5MYfqWH83
   jazWqP789zqI53cdEixs6Bh8tFJZZIfBAmJvBjIiwJCMph5tyMNKKHQC4
   nB4CVDY1o9JskELcmBa/lD72OcliJ98L/0L90UO/ndCMlXKbo+xCrlmTM
   8=;
IronPort-PHdr: =?us-ascii?q?9a23=3ACypLUBSdqEy9Cmj/DLG00IXnNNpsv++ubAcI9p?=
 =?us-ascii?q?oqja5Pea2//pPkeVbS/uhpkESXBNfA8/wRje3QvuigQmEG7Zub+FE6OJ1XH1?=
 =?us-ascii?q?5g640NmhA4RsuMCEn1NvnvOi8zGclET1x013q6KkNSXs35Yg6arw=3D=3D?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: =?us-ascii?q?A0AEAQD1xkFe/5NdJa1lHAEBAQEBBwE?=
 =?us-ascii?q?BEQEEBAEBgWkFAQELAYFTUAVsWCAECyqHWwOLAU6CEYlijjCBLhSBEANUCQE?=
 =?us-ascii?q?BAQwBARsSAgEBhEACgkYkNgcOAgMNAQEEAQEBAgEFBG2FNwyFZgEBAQQSLgE?=
 =?us-ascii?q?BNwEPAgEIEQQBAQEVGSERHQgCBA4FCBqDBYJKAy4BnjACgTmIYoIngn8BAQW?=
 =?us-ascii?q?FBA0LggwJgTgBjCIaggCBEUeCTD6CG4FpJQEBIAI9gwOCLI1Cgl6HJZdtRAq?=
 =?us-ascii?q?COodMilSER4JIiBGESItumXiQEQIEAgQFAg4BAQWBWQQugVhwFYMnCUcYDY4?=
 =?us-ascii?q?dDBeDUIZxg2J0gSmLDYIyAQE?=
X-IronPort-AV: E=Sophos;i="5.70,426,1574121600"; 
   d="scan'208";a="720395866"
Received: from rcdn-core-11.cisco.com ([173.37.93.147])
  by rcdn-iport-4.cisco.com with ESMTP/TLS/DHE-RSA-SEED-SHA; 10 Feb 2020 21:13:01 +0000
Received: from XCH-RCD-003.cisco.com (xch-rcd-003.cisco.com [173.37.102.13])
        by rcdn-core-11.cisco.com (8.15.2/8.15.2) with ESMTPS id 01ALD1YT024066
        (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=FAIL);
        Mon, 10 Feb 2020 21:13:01 GMT
Received: from xhs-rcd-003.cisco.com (173.37.227.248) by XCH-RCD-003.cisco.com
 (173.37.102.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Mon, 10 Feb
 2020 15:13:01 -0600
Received: from xhs-aln-001.cisco.com (173.37.135.118) by xhs-rcd-003.cisco.com
 (173.37.227.248) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Mon, 10 Feb
 2020 15:13:00 -0600
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (173.37.151.57)
 by xhs-aln-001.cisco.com (173.37.135.118) with Microsoft SMTP Server (TLS) id
 15.0.1473.3 via Frontend Transport; Mon, 10 Feb 2020 15:13:00 -0600
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=T8Uhj+CXeGzkWUoa3q0lFNmk+8V3heNWi5LrigdqNARaBosRPisnplXxPMVeHKIy7puECkcSL/LicUBPdpZKyjhE4I4AP1hLmbNSoavv+kGF3QMs0r90iim00ZXcmJZ/MCkrcmqFxGGyysyo6cZoRk7aNRwhHTbSEOza8eVNFig35eAhQGB9dl28fpQNYeJ/IELSjyCIcSzWr3BtZKdOfa9WIw87gZnPK6kVfUeaeZ/K/EjCJ7tdPz4u+Fxd/4nSa7UEM5YRhrebYm9Frh2JLwP4N0DYAQagIIvPkGKZ3lTHtCveuvUmJfW55DpSNOttGBrMPTdMb8eILq/su265FQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+fqQ3Wo0iTs7vM6hwsMEWmQIo1v7RXhJi/xshxAJGOs=;
 b=Ad+MNuJ//6qnLOjsIcnhyrdRNJ3RVmcBxZs/uV5p3rAaKnWw83tAHw3ZnbvUiVfbvuhwQOSHaR37nOOFI57B4mnBJvmokpuZ6YB6pLHqXkfuIfyXvv+cKuSPN0VP7P8SG4utAVGj4RxLuEt6ROEHluTm1Y3X5QEY2UOG+cIyOVAEyvFIpl8N7yg9Udz420pt/gsK7nMX4DYi2+b+M9S9xysD5X3W0GV/qXi6YaJXXLXkX5iXAS3V354xKNF65l8GDT6iqzTKH2IjxbBT+4UnyeMjUSMCW9cBFiym9AtIEW7gkLhdlMRY+Gwwn9mRNW0nHM/e7r35eJGtc3sx9/e3gg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cisco.com; dmarc=pass action=none header.from=cisco.com;
 dkim=pass header.d=cisco.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cisco.onmicrosoft.com;
 s=selector2-cisco-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+fqQ3Wo0iTs7vM6hwsMEWmQIo1v7RXhJi/xshxAJGOs=;
 b=Y2Q7Z4bAoE/yYYvLYrwCMQIxbfaHd9AUmuEtINngXYaHBJYMxVJWv8Ht21ixEY5xsHhH/w78tx0u3+eewjquL9YM34rxxYPD61pUiWEJ20GIUExRHHKfuZRB9HBFH+t57H4O4TC47WnH9HwRjl4uZUggXcYz4UQTn6Tvebki0zU=
Received: from BL0PR11MB3219.namprd11.prod.outlook.com (10.167.233.23) by
 BL0PR11MB2898.namprd11.prod.outlook.com (20.177.146.211) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2707.26; Mon, 10 Feb 2020 21:12:59 +0000
Received: from BL0PR11MB3219.namprd11.prod.outlook.com
 ([fe80::f4ee:122a:9daf:1783]) by BL0PR11MB3219.namprd11.prod.outlook.com
 ([fe80::f4ee:122a:9daf:1783%7]) with mapi id 15.20.2707.030; Mon, 10 Feb 2020
 21:12:59 +0000
From:   "Victor Kamensky (kamensky)" <kamensky@cisco.com>
To:     Paul Burton <paulburton@kernel.org>
CC:     "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
        Ralf Baechle <ralf@linux-mips.org>,
        James Hogan <jhogan@kernel.org>,
        Vincenzo Frascino <vincenzo.frascino@arm.com>,
        "bruce.ashfield@gmail.com" <bruce.ashfield@gmail.com>,
        "richard.purdie@linuxfoundation.org" 
        <richard.purdie@linuxfoundation.org>
Subject: Re: [PATCH 1/2] mips: vdso: fix 'jalr t9' crash in vdso code
Thread-Topic: [PATCH 1/2] mips: vdso: fix 'jalr t9' crash in vdso code
Thread-Index: AQHV2u078/VVzhEDo0WR9ouK+wmFgKgU1sEAgAAFNICAAAolCw==
Date:   Mon, 10 Feb 2020 21:12:59 +0000
Message-ID: <BL0PR11MB3219374C9349EE1B4F174777CD190@BL0PR11MB3219.namprd11.prod.outlook.com>
References: <20200203233133.38613-1-kamensky@cisco.com>
 <20200203233133.38613-2-kamensky@cisco.com>
 <20200210191424.brqyxs5lq7eqounl@lantea.localdomain>,<20200210193301.ella5mokkudw3qgs@lantea.localdomain>
In-Reply-To: <20200210193301.ella5mokkudw3qgs@lantea.localdomain>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=kamensky@cisco.com; 
x-originating-ip: [2001:420:c0c8:1003::bd]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 6ee5933d-4f6b-45ed-527e-08d7ae6e01da
x-ms-traffictypediagnostic: BL0PR11MB2898:
x-microsoft-antispam-prvs: <BL0PR11MB2898EB4BB03DB885B5D64F99CD190@BL0PR11MB2898.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-forefront-prvs: 03094A4065
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(4636009)(366004)(376002)(39860400002)(136003)(346002)(396003)(199004)(189003)(55016002)(9686003)(66476007)(66556008)(76116006)(64756008)(66446008)(66946007)(478600001)(5660300002)(33656002)(71200400001)(52536014)(54906003)(53546011)(6506007)(81156014)(316002)(8676002)(81166006)(186003)(7696005)(6916009)(86362001)(4326008)(2906002)(8936002);DIR:OUT;SFP:1101;SCL:1;SRVR:BL0PR11MB2898;H:BL0PR11MB3219.namprd11.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: cisco.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: D8em3LLLQpeiJ5HOGUZe6eGclSkXZaQgFMXnlB/+VO9xeL7v5nfwSVGfuVN028ALUQ7Bk4bOpn4KzUtMqthzg/kCDPO9UpdbD0u8zTtbD4y5d7Zy5aNgRki/8/8CGVNteC7fAhZe2NaZrErx0zY/xvkVAkUv77ucIObg4wxNst+NjWSKmmgJZbTIrqPuubQvYSrIH/XNMIPTXQXkwoFlvMMeznwEH83vtyE9mkI4H9x5SYyxuLfwy6h0bntuxaDqEEfsZTYAVpb5MfNyUD/dTdV5CphQos3q0EV7Ax/2XLbUomzztKmOZmSyGpDRg40vgTc1ZDOKqu3wKkxjfxhg17jOdcMQ8iFSeRf2ml3A8Y3p25vMq2f46F/yPOk58h4xXX807kFBdOd04SYEZlIuGuxVvjgkiz/BhRvMqrBkOFSSg9bCy68eSdMeO4rDMMfW
x-ms-exchange-antispam-messagedata: 1BEiPH9j1hbNelCnH6k98Mhix/IC34ZlQFzWx/0CrXKrMj7FxTgq09v/aR7rwVAsJhXauOtZmzJkjYl8Ftaai1cFzubA6QOh9dJ2W6Bw34kRMBDjYrHPRlnAChyHt/9GdL9377qcrhrwLpWdcV3jIcVwBkvbjnHrpzo1n3X/Jpk=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 6ee5933d-4f6b-45ed-527e-08d7ae6e01da
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Feb 2020 21:12:59.6565
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 5ae1af62-9505-4097-a69a-c1553ef7840e
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: vEDXrROvfpG16SXELNaQUblKN4zG8zEcDZ4K/jhfhhCPTBSD11K/AWEJRHGkdU9iug5kV4TE6L4l67SuchGxIQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR11MB2898
X-OriginatorOrg: cisco.com
X-Outbound-SMTP-Client: 173.37.102.13, xch-rcd-003.cisco.com
X-Outbound-Node: rcdn-core-11.cisco.com
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi Paul,=0A=
=0A=
Appreciate you looking into this.=0A=
=0A=
Please see inline. Look for 'kamensky>'. Please forgive=0A=
my awful corporate mail agent deficiencies with inline replies.=0A=
Please let me know if you cannot read my inline replies,=0A=
I will re-post this message from my personal account.=0A=
=0A=
________________________________________=0A=
From: linux-mips-owner@vger.kernel.org <linux-mips-owner@vger.kernel.org> o=
n behalf of Paul Burton <paulburton@kernel.org>=0A=
Sent: Monday, February 10, 2020 11:33 AM=0A=
To: Victor Kamensky (kamensky)=0A=
Cc: linux-mips@vger.kernel.org; Ralf Baechle; James Hogan; Vincenzo Frascin=
o; bruce.ashfield@gmail.com; richard.purdie@linuxfoundation.org=0A=
Subject: Re: [PATCH 1/2] mips: vdso: fix 'jalr t9' crash in vdso code=0A=
=0A=
Hi Victor,=0A=
=0A=
On Mon, Feb 10, 2020 at 11:14:24AM -0800, Paul Burton wrote:=0A=
> Which kernel version did you find this issue with? Could you check=0A=
> whether you have commit bbcc5672b006 ("MIPS: Avoid VDSO ABI breakage due=
=0A=
> to global register variable")? That was merged for v5.5-rc5.=0A=
=0A=
Ah, I just spotted your detailed cover letter - my bad :)=0A=
=0A=
Please try moving from v5.4 to v5.4.18 or higher, or just cherry-picking=0A=
the commit I mentioned.=0A=
=0A=
kamensky> Double commit that you mentioned is present in 5.4.15 (since=0A=
kamensky> v5.4.9) that I use. It is 5b004a238460113276319536534928c58d95e59=
9=0A=
=0A=
[kamensky@kamensky-p53s linux]$ git tag --contains 5b004a238460113276319536=
534928c58d95e599=0A=
v5.4.10=0A=
v5.4.11=0A=
v5.4.12=0A=
v5.4.13=0A=
v5.4.14=0A=
v5.4.15=0A=
v5.4.16=0A=
v5.4.17=0A=
v5.4.18=0A=
v5.4.9=0A=
=0A=
kamensky> You can check your tree: disassemble arch/mips/vdso/vgettimeofday=
-n32.o=0A=
kamensky> you would see 'jalr t9' calls, then disassemble arsm/mips/vdso/vd=
os-n32.so=0A=
kamensky> and check that those 'jalr t9' places got converted into 'bal' in=
structions,=0A=
kamensky> even though t9 set up instructions are there. This conversion hap=
pens by=0A=
kamensky> ld during relocation processing if code was compiled with options=
 I propose=0A=
kamensky> to add explicitly. Walk through gcc and binutils places that do t=
hat are in my=0A=
kamensky> cover letter write up.=0A=
=0A=
kamensky> You can reproduce the issue by doing opposite of what I propose:=
=0A=
kamensky> disable -mrelax-pic-calls and -mexplicit-relocs defaults in your=
=0A=
kamensky> toolchain by either using negate variant of option, ie=0A=
kamensky> -mno-relax-pic-calls or -mno-explicit-relocs or both. Something=
=0A=
kamensky> like in diff below. I've tried it on mips-poky-linux-gcc toolchai=
n=0A=
kamensky> that got correct defaults and worked for us before, after adding=
=0A=
kamensky> no variants it shows the same 'jalr t9' crash as with other yocto=
=0A=
kamensky> mips toolchains.=0A=
=0A=
diff --git a/arch/mips/vdso/Makefile b/arch/mips/vdso/Makefile=0A=
index 996a934ece7d..2131c3082580 100644=0A=
--- a/arch/mips/vdso/Makefile=0A=
+++ b/arch/mips/vdso/Makefile=0A=
@@ -31,7 +31,9 @@ cflags-vdso :=3D $(ccflags-vdso) \=0A=
        -O3 -g -fPIC -fno-strict-aliasing -fno-common -fno-builtin -G 0 \=
=0A=
        -fno-stack-protector -fno-jump-tables -DDISABLE_BRANCH_PROFILING \=
=0A=
        $(call cc-option, -fno-asynchronous-unwind-tables) \=0A=
-       $(call cc-option, -fno-stack-protector)=0A=
+       $(call cc-option, -fno-stack-protector) \=0A=
+       $(call cc-option, -mno-relax-pic-calls) \=0A=
+       $(call cc-option, -mno-explicit-relocs)=0A=
=0A=
Thanks,=0A=
Victor=0A=
=0A=
Thanks,=0A=
    Paul=0A=
