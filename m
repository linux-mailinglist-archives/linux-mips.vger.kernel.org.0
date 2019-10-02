Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9F194C947D
	for <lists+linux-mips@lfdr.de>; Thu,  3 Oct 2019 00:54:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727938AbfJBWyG (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 2 Oct 2019 18:54:06 -0400
Received: from mail-eopbgr770097.outbound.protection.outlook.com ([40.107.77.97]:27269
        "EHLO NAM02-SN1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727103AbfJBWyG (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Wed, 2 Oct 2019 18:54:06 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ogpmj5gg/eq5tS5fwKGBTP75SMkh0cLorOxIca+ghjhLO8192jsrgpjD/gezq/QYxJlJEikpPY1pGeORw0Q7sZ/X6mUAdHrMG/mmqsSTpUCZWmo6116GDH70ClvEoeKPirxmGCej6ao2RXowTXfWui3vPEtao4H7b2KVWnbQ9z6g6IfeKwJdZxWIWElgx5NfClZUSaI617rN3kVMO9DmPnKjLBWwa2V8LbJLjPGcOg9PEZnC8SmnoAzVWOTq4NuYEN/7hSBkCxaTOzeZEuIHQ8P5JcmC4XwsoLzVPuCHKVk6owcPsME1ZGjHOFN7XbZy/N71GMD2bNo03ZfAxkrpuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/SjVGnKV1iQXxxBBtwEwvip/UQZrLl4e2goEKzcM7Bk=;
 b=R7xywBArvuPT/8Ln/+xBceoeSKEu5wPmy9uQrdRXGhegXfIB4i8bcpDsJ7foFdqSg4gQdHbLwGgkLEmeZybMmocHpqlq5kZLOb+O+1VgDVrIN2t8cml0WnIkhj/ghUgwrRo/13hZkvcjfRbsVUuQFWkFCLtWWV5z6v40frCVH9MKPHoBEEh7m92TtMCfa3zjclfiW27KCA5IhVAdevJZsZylPdUKgxuNY3SjXzwBc7qJ81/Ji7jLYQgBsmxCSsgPaC9AKp2qVrtRxAbPK/gP/MGsMjNbHapm715FPT0DQvYDn7ISbHs9DvGiyF/ePRJRlqWd+d/mHRJskiomEAs4Dg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wavecomp.com; dmarc=pass action=none header.from=mips.com;
 dkim=pass header.d=mips.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wavecomp.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/SjVGnKV1iQXxxBBtwEwvip/UQZrLl4e2goEKzcM7Bk=;
 b=FckDPxLnz7wkYiNEi4eW+eaHmtdV75IBuYBCAP6Unc9/lXv/mS38Ud1esZdIWFRxWI8e908rNXi58JDcLiQ/ogmsnEbptYQCiTjVMFQVAXgu7IT8c1YGzItVrvgYZLXMrqtgtddpr6jE3tlSly+jr3hZkcOtWgZviEkVQz7Bfjk=
Received: from MWHPR2201MB1277.namprd22.prod.outlook.com (10.172.60.12) by
 MWHPR2201MB1406.namprd22.prod.outlook.com (10.172.62.150) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2305.20; Wed, 2 Oct 2019 22:54:04 +0000
Received: from MWHPR2201MB1277.namprd22.prod.outlook.com
 ([fe80::498b:c2cd:e816:1481]) by MWHPR2201MB1277.namprd22.prod.outlook.com
 ([fe80::498b:c2cd:e816:1481%2]) with mapi id 15.20.2305.023; Wed, 2 Oct 2019
 22:54:04 +0000
From:   Paul Burton <paul.burton@mips.com>
To:     Thomas Bogendoerfer <tbogendoerfer@suse.de>
CC:     Ralf Baechle <ralf@linux-mips.org>,
        Paul Burton <pburton@wavecomp.com>,
        James Hogan <jhogan@kernel.org>,
        "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>
Subject: Re: [PATCH] MIPS: init: Prevent adding memory before PHYS_OFFSET
Thread-Topic: [PATCH] MIPS: init: Prevent adding memory before PHYS_OFFSET
Thread-Index: AQHVeXRJgBTjhxxtCUGmbATa+behkg==
Date:   Wed, 2 Oct 2019 22:54:03 +0000
Message-ID: <MWHPR2201MB12776967D9AF2E04708D6582C19C0@MWHPR2201MB1277.namprd22.prod.outlook.com>
References: <20190924152052.9635-1-tbogendoerfer@suse.de>
In-Reply-To: <20190924152052.9635-1-tbogendoerfer@suse.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: BYAPR04CA0010.namprd04.prod.outlook.com
 (2603:10b6:a03:40::23) To MWHPR2201MB1277.namprd22.prod.outlook.com
 (2603:10b6:301:18::12)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=pburton@wavecomp.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [12.94.197.246]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: cbca7326-4237-405b-2725-08d7478b6bb0
x-ms-traffictypediagnostic: MWHPR2201MB1406:
x-ms-exchange-purlcount: 1
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MWHPR2201MB1406D2C0FD686B1D05028C64C19C0@MWHPR2201MB1406.namprd22.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 0178184651
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(346002)(396003)(39840400004)(376002)(366004)(136003)(189003)(199004)(14454004)(5660300002)(305945005)(74316002)(229853002)(4744005)(476003)(66446008)(64756008)(66556008)(66066001)(33656002)(6246003)(44832011)(76176011)(7696005)(52116002)(478600001)(25786009)(2906002)(6116002)(3846002)(966005)(4326008)(42882007)(52536014)(486006)(55016002)(6306002)(6916009)(446003)(6436002)(9686003)(11346002)(71200400001)(186003)(8936002)(7736002)(316002)(8676002)(71190400001)(81166006)(256004)(81156014)(54906003)(386003)(6506007)(66946007)(66476007)(102836004)(99286004)(26005);DIR:OUT;SFP:1102;SCL:1;SRVR:MWHPR2201MB1406;H:MWHPR2201MB1277.namprd22.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: wavecomp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: UoQoJ//Y+iG4qaM++bQ6nCj/cRyYMlXYmsoXv2PiVX1JUMsRP13LvVMucYu/Wn61fVRv9cyq7zMDDR4zkMOBZAO/8WDAgbvyi1lYfvKgSIg2nHyJpg910lRjZQsyg+/GHrfRl4BrMww5BlFKyDHS3E6Y66R1fhRI7SeqXnPJEdZpxg8rSK6fEqNuYNE/UPf7m9/4HA4W+uRUCoSq17LKjgBaHaxXs2bKVDZj6wH7JZ6vx4IlK+JpF5/danUOHmyv7QRMBqcRIuqTgSCnars6fy63hKYnCJuQgQ/NgD5uxSKwbRTGcMN2YRv2WdEYoCiobElp+WokoPhbtNBhZFemgMMHfMRt3tL086MxhrpPsk30K3ljy15z4oPWAJ3MWEbuX3WXutXfIlm2JAlFbEMRtuBE0kYGMDILsqLPrVBS3PcfyG7sKuZIoqkm3rxpZ7VDubkq/DTn9jYodiWOjMlb6w==
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: mips.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cbca7326-4237-405b-2725-08d7478b6bb0
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Oct 2019 22:54:03.8392
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 463607d3-1db3-40a0-8a29-970c56230104
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: dnZJ3U/q/6afui34TLuSKoOLYyjtS9qJCktmDZiI8CEmS9ffY2+8BV3J0BWRljovqaV99ftLJ4R6+XbhQjehjg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR2201MB1406
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hello,

Thomas Bogendoerfer wrote:
> On some SGI machines (IP28 and IP30) a small region of memory is mirrored
> to pyhsical address 0 for exception vectors while rest of the memory
> is reachable at a higher physical address. ARC PROM marks this
> region as reserved, but with commit a94e4f24ec83 ("MIPS: init: Drop
> boot_mem_map") this chunk is used, when searching for start of ram,
> which breaks at least IP28 and IP30 machines. To fix this
> add_region_memory() checks for start address < PHYS_OFFSET and ignores
> these chunks.

Applied to mips-fixes.

> commit bd848d1b9235
> https://git.kernel.org/mips/c/bd848d1b9235
>=20
> Fixes: a94e4f24ec83 ("MIPS: init: Drop boot_mem_map")
> Signed-off-by: Thomas Bogendoerfer <tbogendoerfer@suse.de>
> Signed-off-by: Paul Burton <paul.burton@mips.com>

Thanks,
    Paul

[ This message was auto-generated; if you believe anything is incorrect
  then please email paul.burton@mips.com to report it. ]
