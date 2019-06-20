Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EF8AA4D560
	for <lists+linux-mips@lfdr.de>; Thu, 20 Jun 2019 19:40:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726626AbfFTRkJ (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 20 Jun 2019 13:40:09 -0400
Received: from mail-eopbgr780137.outbound.protection.outlook.com ([40.107.78.137]:32352
        "EHLO NAM03-BY2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726551AbfFTRkJ (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Thu, 20 Jun 2019 13:40:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=wavesemi.onmicrosoft.com; s=selector1-wavesemi-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5HeaaIVt9Q4f2n9+9sahlYE+WqBkJ9bpYNxJPYWzByU=;
 b=Z9T9Tr+wimmv78CFgeS+p2eyb5iYb7sZmBId5M5KDvtNr93Uc8hl4Gc4EzBjCFUM5h4B7EQrw1Y+QbOBtJQxp50vX17qFB/T+1jaAwVKGl8C2ZQYYi/E39sLBrQaJccBCiroTua15IlpMTfwiVjG2xIpATBCCS/ANslsMb29F3E=
Received: from MWHPR2201MB1277.namprd22.prod.outlook.com (10.172.60.12) by
 MWHPR2201MB1342.namprd22.prod.outlook.com (10.172.61.16) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1987.12; Thu, 20 Jun 2019 17:40:04 +0000
Received: from MWHPR2201MB1277.namprd22.prod.outlook.com
 ([fe80::6975:b632:c85b:9e40]) by MWHPR2201MB1277.namprd22.prod.outlook.com
 ([fe80::6975:b632:c85b:9e40%2]) with mapi id 15.20.2008.007; Thu, 20 Jun 2019
 17:40:04 +0000
From:   Paul Burton <paul.burton@mips.com>
To:     Serge Semin <fancer.lancer@gmail.com>,
        "Maciej W. Rozycki" <macro@linux-mips.org>
CC:     Ralf Baechle <ralf@linux-mips.org>,
        James Hogan <jhogan@kernel.org>,
        Serge Semin <Sergey.Semin@t-platforms.ru>,
        Arnd Bergmann <arnd@arndb.de>,
        "Vadim V . Vlasov" <vadim.vlasov@t-platforms.ru>,
        "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] mips: Remove q-accessors from non-64bit platforms
Thread-Topic: [PATCH] mips: Remove q-accessors from non-64bit platforms
Thread-Index: AQHVInt4cLa0IUSxeEKd/1SMoCpE8aak2WkA
Date:   Thu, 20 Jun 2019 17:40:04 +0000
Message-ID: <20190620174002.tgayzon7dc5d57fh@pburton-laptop>
References: <20190614063341.1672-1-fancer.lancer@gmail.com>
In-Reply-To: <20190614063341.1672-1-fancer.lancer@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: BYAPR06CA0052.namprd06.prod.outlook.com
 (2603:10b6:a03:14b::29) To MWHPR2201MB1277.namprd22.prod.outlook.com
 (2603:10b6:301:18::12)
user-agent: NeoMutt/20180716
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=pburton@wavecomp.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [12.94.197.246]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 0da558d0-bd7d-4caf-0dd0-08d6f5a653ba
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);SRVR:MWHPR2201MB1342;
x-ms-traffictypediagnostic: MWHPR2201MB1342:
x-microsoft-antispam-prvs: <MWHPR2201MB1342E019D6FAD0B9F7F6112BC1E40@MWHPR2201MB1342.namprd22.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-forefront-prvs: 0074BBE012
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(7916004)(346002)(39850400004)(136003)(366004)(376002)(396003)(199004)(189003)(2906002)(1076003)(229853002)(8936002)(102836004)(6116002)(44832011)(6506007)(26005)(6436002)(3846002)(186003)(386003)(305945005)(25786009)(7736002)(5660300002)(99286004)(476003)(486006)(81166006)(81156014)(53936002)(76176011)(68736007)(6512007)(9686003)(6246003)(256004)(71200400001)(71190400001)(52116002)(4326008)(6486002)(14444005)(66446008)(64756008)(54906003)(316002)(66476007)(8676002)(110136005)(11346002)(66946007)(42882007)(58126008)(66556008)(66066001)(33716001)(478600001)(14454004)(73956011)(446003);DIR:OUT;SFP:1102;SCL:1;SRVR:MWHPR2201MB1342;H:MWHPR2201MB1277.namprd22.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: wavecomp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: Fp1rW7ewMFSKS81hq2vDf+uWEgvdADLbcWzeBFTu69Nau3BXx1DnfrEzXQJDStY3sV3hl8inKVv3M1/eatM9Mu4lQ5GgsSIwowtfxNWAJvYyyTj8/0i09Khj0Zg1L9dKbgBvNCc1pzjSrwOZmgR+DPMIbTZK2M4B5nNVOZtJTJ3J6rNmiqMEQr6Z50sX7UVt34hCDyQVLFFhKAcwAijlX+leIncNJEVkz0dZGPm6iXZfko+OQtPpwc70JawxFAwUpja/XtH+bSBnJtRNy1vJ8DAG8BRZ1vZLvpIRLsHdpE6vmt5MH71+XdcCQtcMziZ3X3b4XAIjEXkX8074iQpgqiKVFDtiiVazr4GkB/+/AgKVFQ05SC/5/KTPMNoizHEvAuDSgUplyXf+U5/nc+V8FUXETRWBm8aBHrlUakpI9j8=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <9FCA6535F2A6F64AA724B351E6258083@namprd22.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: mips.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0da558d0-bd7d-4caf-0dd0-08d6f5a653ba
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Jun 2019 17:40:04.4198
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 463607d3-1db3-40a0-8a29-970c56230104
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: pburton@wavecomp.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR2201MB1342
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi Serge,

On Fri, Jun 14, 2019 at 09:33:42AM +0300, Serge Semin wrote:
> There are some generic drivers in the kernel, which make use of the
> q-accessors or their derivatives. While at current asm/io.h the accessors
> are defined, their implementation is only applicable either for 64bit
> systems, or for systems with cpu_has_64bits flag set. Obviously there
> are MIPS systems which are neither of these, but still need to have
> those drivers supported. In this case the solution is to define some
> generic versions of the q-accessors, but with a limitation to be
> non-atomic. Such accessors are defined in the
> io-64-nonatomic-{hi-lo,lo-hi}.h file. The drivers which utilize the
> q-suffixed IO-methods are supposed to include the header file, so
> in case if these accessors aren't defined for the platform, the generic
> non-atomic versions are utilized. Currently the MIPS-specific asm/io.h
> file provides the q-accessors for any MIPS system even for ones, which
> in fact don't support them and raise BUG() in case if any of them is
> called. Due to this the generic versions of the accessors are never
> used while an attempt to call the IO-methods causes the kernel BUG().
> In order to fix this we need to define the q-accessors only for
> the MIPS systems, which actually support them, and don't define them
> otherwise, so to let the corresponding drivers to use the non-atomic
> q-suffixed accessors.
>=20
> Signed-off-by: Serge Semin <fancer.lancer@gmail.com>
> Suggested-by: Arnd Bergmann <arnd@arndb.de>
> Cc: Vadim V. Vlasov <vadim.vlasov@t-platforms.ru>
> ---
>  arch/mips/include/asm/io.h | 11 +++++++++++
>  1 file changed, 11 insertions(+)

So this seems pretty reasonable. Build testing all our defconfigs only
showed up one issue for decstation_defconfig & decstation_r4k_defconfig:

  drivers/net/fddi/defza.c: In function 'fza_reads':
  drivers/net/fddi/defza.c:88:17: error: implicit declaration of
    function 'readq_relaxed'; did you mean 'readw_relaxed'?
    [-Werror=3Dimplicit-function-declaration]
   #define readq_u readq_relaxed
                   ^~~~~~~~~~~~~
  drivers/net/fddi/defza.c:126:13: note: in expansion of macro 'readq_u'
      *dst++ =3D readq_u(src++);
               ^~~~~~~
  drivers/net/fddi/defza.c: In function 'fza_writes':
  drivers/net/fddi/defza.c:92:18: error: implicit declaration of
    function 'writeq_relaxed'; did you mean 'writel_relaxed'?
    [-Werror=3Dimplicit-function-declaration]
   #define writeq_u writeq_relaxed
                    ^~~~~~~~~~~~~~
  drivers/net/fddi/defza.c:151:4: note: in expansion of macro 'writeq_u'
      writeq_u(*src++, dst++);
      ^~~~~~~~
    CC      net/core/scm.o
  cc1: some warnings being treated as errors
  make[4]: *** [scripts/Makefile.build:279: drivers/net/fddi/defza.o] Error=
 1

These uses of readq_relaxed & writeq_relaxed are both conditional upon
sizeof(unsigned long) =3D=3D 8, ie. upon CONFIG_64BIT=3Dy so they're not go=
ing
to present a runtime issue but we need to provide some implementation of
the *q accessors to keep the compiler happy.

I see a few options:

1) We could just have defza.c include <io-64-nonatomic-lo-hi.h> to get
   the appropriate declarations, which should then get optimized away by
   the compiler anyway & never actually be used.

2) We could have defza.h #define its readq_u & writeq_u macros
   differently for CONFIG_32BIT=3Dy kernels, perhaps using
   __compiletime_error to catch any bogus use of them.

3) We could do the same in a generic header, though if nobody else has
   needed it so far & this is the only place we need it then maybe it's
   not worth it.

So I'm thinking option 2 might be best, as below. Having said that I
don't mind option 1 either - it's simple. Maciej do you have any
preference?

Thanks,
    Paul

---
diff --git a/drivers/net/fddi/defza.c b/drivers/net/fddi/defza.c
index c5cae8e74dc4..85d6a7f22fe7 100644
--- a/drivers/net/fddi/defza.c
+++ b/drivers/net/fddi/defza.c
@@ -85,11 +85,21 @@ static u8 hw_addr_beacon[8] =3D { 0x01, 0x80, 0xc2, 0x0=
0, 0x01, 0x00 };
  */
 #define readw_u readw_relaxed
 #define readl_u readl_relaxed
-#define readq_u readq_relaxed
=20
 #define writew_u writew_relaxed
 #define writel_u writel_relaxed
-#define writeq_u writeq_relaxed
+
+#ifdef CONFIG_32BIT
+extern u64 defza_readq_u(const void *ptr)
+	__compiletime_error("readq_u should not be used by 32b kernels");
+extern void defza_writeq_u(u64 val, void *ptr)
+	__compiletime_error("writeq_u should not be used by 32b kernels");
+# define readq_u defza_readq_u
+# define writeq_u defza_writeq_u
+#else
+# define readq_u readq_relaxed
+# define writeq_u writeq_relaxed
+#endif
=20
 static inline struct sk_buff *fza_alloc_skb_irq(struct net_device *dev,
 						unsigned int length)

