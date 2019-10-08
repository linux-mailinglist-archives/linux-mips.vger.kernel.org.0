Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 20A52D0037
	for <lists+linux-mips@lfdr.de>; Tue,  8 Oct 2019 19:55:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728465AbfJHRzo (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 8 Oct 2019 13:55:44 -0400
Received: from mail-eopbgr800111.outbound.protection.outlook.com ([40.107.80.111]:55108
        "EHLO NAM03-DM3-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726320AbfJHRzn (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Tue, 8 Oct 2019 13:55:43 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Nu5m4TwCUPU7NoL16PT/K9LvXTJlsif3TnnXDbtCFPdGFgIHk/FRrQBTjWKkNVVi0jmCy8j73OtQxzqIyJstMrJYv/Q9Ev0NzyMZDZOTrcs5J6rEaNv0jR2YarJNh3E8qpNxhRN6qAKkl4lU2CKDcdWlruW2xb2XWzqC/kkGOBXlZVVPmpgWmVWReIamO+YwUkIbe2KdRsDWqg+1ZJRw8e1IeVsBqlrTny/bouHsNR1ZQ5KUcZtJoS6v3EIQDa+vdipfBuXJ918kPgCs0nx3qvxxrJYPEJGriilzCUnkkF0XN+9tEbqGdKq0tiKql3+K6oB5Ue5AFNyjsqqBCOq47Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ma9otyuCs5QVRPOxyJHnPdQwB1znz2ict8ZxBQ7PGyw=;
 b=Y4DXpYbN1gLaMVxx45Sqvu9/D27C+aHM265ZiUdsWbfMcA3kc3xbLw9kDOtfhrHDMMMxuFZN7TxNrW0pCfrjAahiLSpK5uqxwwB5BvS7sm/fyv5DD1rLmgJvw3GUszhFXDNOCIfF/iqUqu8hdxNKTubtjAtr9tpLatlNTSQlkfN+vzAL6OrBl/on33HsUoSP5AHk+d509squfzpygq+GR2Qg/WtbUolz+5XDW/lCgQc6GPgTfAY7s9zuVHCCecq2ZkOdYQwn+kjMr1abcVCxfOjGKCppE9Zz2gpJXhpao1vx76jDZcQgN7O36jeWJnh7T0YlUQZ2tsQR+SKk2Hhbug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wavecomp.com; dmarc=pass action=none header.from=mips.com;
 dkim=pass header.d=mips.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wavecomp.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ma9otyuCs5QVRPOxyJHnPdQwB1znz2ict8ZxBQ7PGyw=;
 b=dHeIDJ5HtmIlAAIdkBeR9OGKXnplhlS6qf6qf7+CUVagsj8tI/7Gk32j4hgMh8iEqdhxVWs4r0DNOgetcxjSAt+RWHPXi6RhjLS0uziio5B4La1hwJj0bJstzxqB0LpwJkiNveFCxJGNr2SwFMTIQeckqqew+1yBGubLzbXbznI=
Received: from MWHPR2201MB1277.namprd22.prod.outlook.com (10.172.60.12) by
 MWHPR2201MB1648.namprd22.prod.outlook.com (10.174.167.37) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2327.24; Tue, 8 Oct 2019 17:55:32 +0000
Received: from MWHPR2201MB1277.namprd22.prod.outlook.com
 ([fe80::c1dc:dba3:230c:e7f0]) by MWHPR2201MB1277.namprd22.prod.outlook.com
 ([fe80::c1dc:dba3:230c:e7f0%8]) with mapi id 15.20.2347.016; Tue, 8 Oct 2019
 17:55:32 +0000
From:   Paul Burton <paul.burton@mips.com>
To:     Tiezhu Yang <yangtiezhu@loongson.cn>
CC:     Paul Burton <pburton@wavecomp.com>,
        "ralf@linux-mips.org" <ralf@linux-mips.org>,
        "jhogan@kernel.org" <jhogan@kernel.org>,
        "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>
Subject: Re: [PATCH v2] MIPS: generic: Use __initconst for const init data
Thread-Topic: [PATCH v2] MIPS: generic: Use __initconst for const init data
Thread-Index: AQHVfgGU2pbwZN3FCEGkxfviXmdIeQ==
Date:   Tue, 8 Oct 2019 17:55:32 +0000
Message-ID: <MWHPR2201MB1277014C13FB6EB4AEE74A01C19A0@MWHPR2201MB1277.namprd22.prod.outlook.com>
References: <1570551309-21021-1-git-send-email-yangtiezhu@loongson.cn>
In-Reply-To: <1570551309-21021-1-git-send-email-yangtiezhu@loongson.cn>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: BYAPR08CA0018.namprd08.prod.outlook.com
 (2603:10b6:a03:100::31) To MWHPR2201MB1277.namprd22.prod.outlook.com
 (2603:10b6:301:18::12)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=pburton@wavecomp.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [12.94.197.246]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: abc21239-a526-495e-051b-08d74c18b696
x-ms-traffictypediagnostic: MWHPR2201MB1648:
x-ms-exchange-purlcount: 1
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MWHPR2201MB164833F9D359181B6C15D225C19A0@MWHPR2201MB1648.namprd22.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3631;
x-forefront-prvs: 01842C458A
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(39840400004)(346002)(366004)(136003)(396003)(376002)(189003)(199004)(8676002)(71190400001)(81156014)(2906002)(81166006)(7736002)(8936002)(66946007)(99286004)(476003)(64756008)(66556008)(66446008)(66476007)(6916009)(305945005)(74316002)(6306002)(55016002)(5660300002)(52536014)(9686003)(33656002)(6246003)(66066001)(186003)(229853002)(44832011)(446003)(11346002)(486006)(42882007)(26005)(6116002)(102836004)(6506007)(52116002)(3846002)(76176011)(7696005)(386003)(256004)(4326008)(6436002)(4744005)(25786009)(71200400001)(966005)(14454004)(478600001)(316002)(54906003)(41533002);DIR:OUT;SFP:1102;SCL:1;SRVR:MWHPR2201MB1648;H:MWHPR2201MB1277.namprd22.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: wavecomp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: XyTYRRckMm2Y+r7f8LmEU434RnuZ0k/lLjvHluD/kEvtSlKW5Fv9QjVBgZ5dZpG9zFyiknwQb8GohRIbYrKd55nqnNZrlwuvQRas9GvU0flsSM7NzqilUsM1DNFZGoWn0n32kRxqsTsMPvy3haeUIDRGhoqap6+UIUy6l7Q77+F7rn8AqQHj4PGS8WLOQiBZWp4bVRJWWC1Q19Zl9IUZM7IdVjzD02GhqkSiFjd4+gOyF3IyF26ksKuSd0jo/lQae2mqRXCVy+g/3kg3ULJG6t7CfLFw74fqxnxr1BI7YMYiLSL9l3bIxPkkIiGjfoyINnhefoh7LSIBXiNCq02QgzJsZmX8cxaxI/K64g6yjiT61pZzaoER5bu+sMLlQCfeVKRpQcwj83tbJzltRXrmXKbz2Yds42t3rD/H/Ss/2kuZBK+CpVWVhY3ikSnBed4qIi2Y4ECO92KsFIlFDWxRNg==
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: mips.com
X-MS-Exchange-CrossTenant-Network-Message-Id: abc21239-a526-495e-051b-08d74c18b696
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Oct 2019 17:55:32.4444
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 463607d3-1db3-40a0-8a29-970c56230104
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: zxXMKBaj0quauH3vdgY+WQJNp1LTtTbn/5uXvMcQ4L4rY5cvmSydOaDxXhAiJfQTflcl0jwRyXggcYxr98NY2A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR2201MB1648
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hello,

Tiezhu Yang wrote:
> Fix the following checkpatch errors:
>=20
> $ ./scripts/checkpatch.pl --no-tree -f arch/mips/generic/init.c
> ERROR: Use of const init definition must use __initconst
> #23: FILE: arch/mips/generic/init.c:23:
> +static __initdata const void *fdt;
>=20
> ERROR: Use of const init definition must use __initconst
> #24: FILE: arch/mips/generic/init.c:24:
> +static __initdata const struct mips_machine *mach;
>=20
> ERROR: Use of const init definition must use __initconst
> #25: FILE: arch/mips/generic/init.c:25:
> +static __initdata const void *mach_match_data;

Applied to mips-next.

> commit a14bf1dc494a
> https://git.kernel.org/mips/c/a14bf1dc494a
>=20
> Fixes: eed0eabd12ef ("MIPS: generic: Introduce generic DT-based board sup=
port")
> Signed-off-by: Tiezhu Yang <yangtiezhu@loongson.cn>
> Signed-off-by: Paul Burton <paul.burton@mips.com>

Thanks,
    Paul

[ This message was auto-generated; if you believe anything is incorrect
  then please email paul.burton@mips.com to report it. ]
