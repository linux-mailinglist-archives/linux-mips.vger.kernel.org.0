Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5452C51A4B
	for <lists+linux-mips@lfdr.de>; Mon, 24 Jun 2019 20:10:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729968AbfFXSKb (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 24 Jun 2019 14:10:31 -0400
Received: from mail-eopbgr790133.outbound.protection.outlook.com ([40.107.79.133]:54117
        "EHLO NAM03-CO1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727763AbfFXSKa (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Mon, 24 Jun 2019 14:10:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=wavesemi.onmicrosoft.com; s=selector1-wavesemi-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xdHrtcPto2yc7+IMcmpFN9DTl57meMlYUJeWRqY2MYA=;
 b=OYwmB+0u3D5A2ScpX2rpUt+yDXGU7MfU35x4BsZqoyIM7y2b9SAK4b2DCE7Vk+k3Sbr/lpp5Brt8o0OQYze/lYf+yAlaZ+NN7Ufb8ZsFkkv010SAPqqasBJ+j4INHt5p/Unm+HSyd1rtkW9djlSQswGInPJeAb3a4dbJ9p3aIAg=
Received: from MWHPR2201MB1277.namprd22.prod.outlook.com (10.172.60.12) by
 MWHPR2201MB1472.namprd22.prod.outlook.com (10.174.170.145) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2008.16; Mon, 24 Jun 2019 18:10:27 +0000
Received: from MWHPR2201MB1277.namprd22.prod.outlook.com
 ([fe80::6975:b632:c85b:9e40]) by MWHPR2201MB1277.namprd22.prod.outlook.com
 ([fe80::6975:b632:c85b:9e40%2]) with mapi id 15.20.2008.014; Mon, 24 Jun 2019
 18:10:27 +0000
From:   Paul Burton <paul.burton@mips.com>
To:     Hauke Mehrtens <hauke@hauke-m.de>
CC:     "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>
Subject: Re: Call trace stops at static callback functions
Thread-Topic: Call trace stops at static callback functions
Thread-Index: AQHVKPexf+3KgXuhwUedlvqPhkwyj6arHkIA
Date:   Mon, 24 Jun 2019 18:10:27 +0000
Message-ID: <20190624181025.3323kk3eh4zxxj6w@pburton-laptop>
References: <b201c33a-5beb-3dfb-b99b-d9b8fc6c2c64@hauke-m.de>
In-Reply-To: <b201c33a-5beb-3dfb-b99b-d9b8fc6c2c64@hauke-m.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: BYAPR07CA0036.namprd07.prod.outlook.com
 (2603:10b6:a02:bc::49) To MWHPR2201MB1277.namprd22.prod.outlook.com
 (2603:10b6:301:18::12)
user-agent: NeoMutt/20180716
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=pburton@wavecomp.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [12.94.197.246]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 61bca9ed-d0ed-48c7-d808-08d6f8cf3c33
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);SRVR:MWHPR2201MB1472;
x-ms-traffictypediagnostic: MWHPR2201MB1472:
x-microsoft-antispam-prvs: <MWHPR2201MB14722905829C6860E02CA023C1E00@MWHPR2201MB1472.namprd22.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 007814487B
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(7916004)(136003)(346002)(366004)(39840400004)(376002)(396003)(199004)(189003)(66946007)(76176011)(73956011)(99286004)(6512007)(9686003)(8936002)(44832011)(486006)(186003)(229853002)(66446008)(64756008)(8676002)(6436002)(66476007)(81166006)(6116002)(3846002)(476003)(2906002)(446003)(66066001)(7736002)(256004)(305945005)(42882007)(5660300002)(52116002)(66556008)(11346002)(68736007)(58126008)(4326008)(33716001)(6486002)(81156014)(478600001)(6246003)(71200400001)(1076003)(316002)(102836004)(25786009)(6916009)(71190400001)(26005)(386003)(14454004)(53936002)(6506007);DIR:OUT;SFP:1102;SCL:1;SRVR:MWHPR2201MB1472;H:MWHPR2201MB1277.namprd22.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: wavecomp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: kNHH89VqAF3cI8bPqOuQ6MrCDaoK9tVjn32/LWBOP993o/fqk/HSTPhOQnoqxaxINzDE4ny/Oi6OE2FkTRRAnjKSKWwdfZizd1X36LRVKLaQoIlcfvS64XqHxZwjyxUd7M0omRBSqvXYEm1bwDH0Pl/f0xaGHA1g6uCQc3e2//7WV2a0QQ3i+iIhyKPxTTfSUm9NKhVCXHOneKwLaqukY8gcj5liePzef09TtIMQbXNg6sZQ5OauvrrbG5TSyL6ETeB67125t5iNmxTU/TQ8OIJsLZcVzQJ81LYpqqiiTgrvxlKJdOsabothWNP3R1cpa0NHe/IPiIWlE7m2bxxipDvOpn0wEWCL9K2HKpPZEgBrnjbF/gG7kIx0TlYnV8HkT9Id/cvzsrnoRsgJJSnMrQ6Wx8zkUzO881C9MP4t3OY=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <7DBFC0543AB3234E93135689AE131A2B@namprd22.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: mips.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 61bca9ed-d0ed-48c7-d808-08d6f8cf3c33
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Jun 2019 18:10:27.7378
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 463607d3-1db3-40a0-8a29-970c56230104
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: pburton@wavecomp.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR2201MB1472
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi Hauke,

On Sat, Jun 22, 2019 at 02:40:26PM +0200, Hauke Mehrtens wrote:
> When I add a WARN_ON(1) to trigger a backtrace into the static callback
> function veth_newlink() in drivers/net/veth.c the backtrace stops at
> this functions. When I remove the static from this function the
> backtrace is looking like expected.
>=20
> Call trace with static function:
> [   30.686208] Call Trace:
> [   30.686583] [<8010ca98>] show_stack+0x90/0x138
> [   30.686953] [<8066ae80>] dump_stack+0x94/0xcc
> [   30.687122] [<801307cc>] __warn+0x130/0x144
> [   30.687293] [<80130898>] warn_slowpath_null+0x44/0x58
> [   30.687545] [<c0023800>] 0xc0023800
> [   30.687959] ---[ end trace df91e2ca103d67ec ]---
>=20
> Call trace without static:
> [   26.519328] Call Trace:
> [   26.519648] [<8010ca98>] show_stack+0x90/0x138
> [   26.520067] [<8066ae80>] dump_stack+0x94/0xcc
> [   26.520282] [<801307cc>] __warn+0x130/0x144
> [   26.520466] [<80130898>] warn_slowpath_null+0x44/0x58
> [   26.520773] [<c0023800>] veth_newlink+0x64/0x1464 [veth]
> [   26.521041] [<80541628>] __rtnl_newlink+0x5c8/0x790
> [   26.521259] [<80541840>] rtnl_newlink+0x50/0x84
> [   26.521456] [<8053b430>] rtnetlink_rcv_msg+0x340/0x3ec
> [   26.521697] [<80571ba4>] netlink_rcv_skb+0xa0/0x150
> [   26.521908] [<805712d8>] netlink_unicast+0x1c4/0x2b0
> [   26.522121] [<805716ac>] netlink_sendmsg+0x2e8/0x3f8
> [   26.522336] [<804fcf6c>] ___sys_sendmsg+0x144/0x2ac
> [   26.522546] [<804fe22c>] __sys_sendmsg+0x4c/0x94
> [   26.522748] [<80114a98>] syscall_common+0x34/0x58
> [   26.523214] ---[ end trace 9a18b9fb2030ab29 ]---
>=20
> This was done with kernel 5.2-rc5 build with OpenWrt (GCC 7.4) for Malta
> 24Kc big endian, the kernel did not contain any extra OpenWrt patches,
> only the WARN_ON(1) was added to trigger this call trace.
>=20
> Is it excepted that the call trace stops at such positions? It would be
> really nice if it would go further to better interpret such call traces.

It's not ideal or intentional, no...

It would be interesting to see the disassembly for veth_newlink in both
cases - I wouldn't expect anything to change since the function isn't
called directly so shouldn't get inlined or anything, but it'd be good
to check. If something did change this could be a bug or limitation of
our stack unwinding code (see get_frame_info) which works by examining
code, looking for store instructions that save ra/$31 to the stack &
additions to sp/$29.

Could you also share your .config? I presume CONFIG_KALLSYMS is enabled?

If you look at vmlinux using nm or readelf -s do you see the
veth_newlink symbol?

Thanks,
    Paul

> I used this command to call this function:
> 	ip link add veth0 type veth peer name veth1
>=20
> I also saw this with kernel 4.9.
>=20
> Hauke
