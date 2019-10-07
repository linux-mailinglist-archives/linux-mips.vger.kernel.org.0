Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 81D46CEB14
	for <lists+linux-mips@lfdr.de>; Mon,  7 Oct 2019 19:54:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728916AbfJGRx4 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 7 Oct 2019 13:53:56 -0400
Received: from mail-eopbgr770097.outbound.protection.outlook.com ([40.107.77.97]:18055
        "EHLO NAM02-SN1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1728031AbfJGRxz (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Mon, 7 Oct 2019 13:53:55 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LdjqRuFjydzpeC3/RXOEvY7gW6LiLaQfwLc0JcIas7r2S1epcolC7MVfoJb0b9IdRxMtsc1nI9g0CCtyGXvhZx/I7pGfmb8DslzTpjcHUz1NJRO+gFaSyYWbHNIvkEW/1SVvKLdzkKw84bDxNlTCHUaLvIPVTRcnRaxqZZlyDOleXMJxqO0UDxgCxNzW3plZyVXFGun5DbFvm38N8JlLeda/nZWy+rhEDtZunpJtJuBSmNON43jdvp/hPvlKGrt4zyGQm+nZjjLivh/iu1jrcAI2oCin7pQeZuPkCFwaBP84t+o5XmpnwCqVnXRLSjmBGTn0InG7P0pkC7+5AdqM/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xmWX3a7LTtSvOau7tlxGkfn1nd13nbkiQS0DiYtEgNU=;
 b=Q4qG7QLjVl2eBDBpdzr9+1+IgoKz8lS0HXKYtoMtjjMFX89YrZx5W0pqkNrkpDBoDivCmXTWadDD8NFPugFbUeLQBcTCQoKx5Q7ftl0qYJWicRu38BCk3OZpKZC3brdTP9lubiem0e1KsXSlDLm9qAEWatkW6Byv5dhJWS0diVNQ0lDYi8dUinQempVKLV+rHVeWlKQqTwnOYG8GmmgnajWsigAGnZvBkXb+RowxIiC7c1JZenR5hPtvV4+ib6yzIhrZP+FsJ6QzJm+Pdo6AYOiaQOqFZwn9tTbNnC/kaMDZRpgQCo6owjq2wYGpxEiv1nB3lzJVPJV1uhVRPF1myw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wavecomp.com; dmarc=pass action=none header.from=mips.com;
 dkim=pass header.d=mips.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wavecomp.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xmWX3a7LTtSvOau7tlxGkfn1nd13nbkiQS0DiYtEgNU=;
 b=RcvQxlPRI/PmHZY4YqxKKntAza0Fi0pGhk71tJyvbVzq69T/yzDEofAKX9f5M3ZN1NfDMmb1t43la0iQnNseHg0FtAryz6bg4aYqE8vW3jpfN+Y9NQzz6TB4y9FcOhFgLPYmjH7O4kq70XKlTfR1EmiVGyWo7DxjwSF4DMkBT3c=
Received: from MWHPR2201MB1277.namprd22.prod.outlook.com (10.172.60.12) by
 MWHPR2201MB1549.namprd22.prod.outlook.com (10.174.170.162) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2327.24; Mon, 7 Oct 2019 17:53:53 +0000
Received: from MWHPR2201MB1277.namprd22.prod.outlook.com
 ([fe80::3050:9a38:9d8e:8033]) by MWHPR2201MB1277.namprd22.prod.outlook.com
 ([fe80::3050:9a38:9d8e:8033%5]) with mapi id 15.20.2327.025; Mon, 7 Oct 2019
 17:53:53 +0000
From:   Paul Burton <paul.burton@mips.com>
To:     Alexandre GRIVEAUX <agriveaux@deutnet.info>
CC:     "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "mark.rutland@arm.com" <mark.rutland@arm.com>,
        "ralf@linux-mips.org" <ralf@linux-mips.org>,
        Paul Burton <pburton@wavecomp.com>,
        "jhogan@kernel.org" <jhogan@kernel.org>,
        "agriveaux@deutnet.info" <agriveaux@deutnet.info>,
        "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>
Subject: Re: [PATCH v2 3/5] MIPS: CI20: DTS: Add IW8103 Wifi + bluetooth
Thread-Topic: [PATCH v2 3/5] MIPS: CI20: DTS: Add IW8103 Wifi + bluetooth
Thread-Index: AQHVfTguvoW5h/OmckaE+SblGSjqRw==
Date:   Mon, 7 Oct 2019 17:53:52 +0000
Message-ID: <MWHPR2201MB1277EF64AE565D6E3AB2A803C19B0@MWHPR2201MB1277.namprd22.prod.outlook.com>
References: <cda033047367d5359067f6d7e9a73cebc6cdc722.1569955865.git.agriveaux@deutnet.info>
In-Reply-To: <cda033047367d5359067f6d7e9a73cebc6cdc722.1569955865.git.agriveaux@deutnet.info>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: BY5PR13CA0020.namprd13.prod.outlook.com
 (2603:10b6:a03:180::33) To MWHPR2201MB1277.namprd22.prod.outlook.com
 (2603:10b6:301:18::12)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=pburton@wavecomp.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [12.94.197.246]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 3143de87-9ff3-44ae-1ff2-08d74b4f50b5
x-ms-traffictypediagnostic: MWHPR2201MB1549:
x-ms-exchange-purlcount: 1
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MWHPR2201MB154989B225D145F37CB5E99EC19B0@MWHPR2201MB1549.namprd22.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1850;
x-forefront-prvs: 01834E39B7
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(376002)(136003)(346002)(396003)(366004)(39840400004)(189003)(199004)(52116002)(99286004)(476003)(7736002)(305945005)(54906003)(76176011)(25786009)(486006)(33656002)(42882007)(478600001)(2906002)(11346002)(446003)(52536014)(5660300002)(6246003)(7696005)(4744005)(71200400001)(71190400001)(66066001)(316002)(14454004)(229853002)(102836004)(9686003)(81156014)(6436002)(81166006)(6116002)(55016002)(74316002)(3846002)(44832011)(4326008)(8676002)(186003)(6916009)(26005)(966005)(386003)(8936002)(6506007)(6306002)(66946007)(66556008)(64756008)(66446008)(66476007)(256004)(6606295002);DIR:OUT;SFP:1102;SCL:1;SRVR:MWHPR2201MB1549;H:MWHPR2201MB1277.namprd22.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: wavecomp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: C17bI9f4+19yH2SpqL4Tu3aw6GXjioiHzOiGVyc0Czw9OHkwWcrkOAJgF37fEQcvLZ80K1gRLiXJN00yALXnmgKDztCLRDyrRwZpuYtZiwD1nzxal0aC0nA6UgAX/M83y5X6B4wF6iTkVx6cJgR/kcVxsseKzos2M6aDrkoI+pO01hM93jhU+p2Csp9xDkQchcEsz2KQdU7tFt4pdfsIoeT0CpjRLsQHxrEYc/QfFGq+a0x17s0e5iFnkJqVFv3yX24KYbcDGSnVY55Uw+kEJwyJ2hC7kKv+PCLAtt68SZcRYOeVKxLHzZnppflfLGTs7MVXix3PryHZ7I7Yz4s0wdT1dX02S2VJs6SfqsaXxyUnYok9yGC++fd2U+0RLoZLScu02JuB01lNTgidFqdLbbthH1QzmFlLbltIyajX3W8ytmqeQkU5jo8nuExNWkbnpHBpdJtyBfe769Na1zKRMA==
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: mips.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3143de87-9ff3-44ae-1ff2-08d74b4f50b5
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Oct 2019 17:53:53.2038
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 463607d3-1db3-40a0-8a29-970c56230104
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 0D21+dZTxAWs7tp6+2yHlzNZaPaas5QT13n9FunFc5Frk5AZ/pO6ZKPacdXNMs8cVYVlPCpeKdF1mA1U+AbZIA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR2201MB1549
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hello,

Alexandre GRIVEAUX wrote:
> Add IW8103 Wifi + bluetooth module to device tree and related power domai=
n.

Applied to mips-next.

> commit 948f2708f945
> https://git.kernel.org/mips/c/948f2708f945
>=20
> Signed-off-by: Alexandre GRIVEAUX <agriveaux@deutnet.info>
> Signed-off-by: Paul Burton <paul.burton@mips.com>

Thanks,
    Paul

[ This message was auto-generated; if you believe anything is incorrect
  then please email paul.burton@mips.com to report it. ]
