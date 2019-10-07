Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 27E48CEAF8
	for <lists+linux-mips@lfdr.de>; Mon,  7 Oct 2019 19:51:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728079AbfJGRvE (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 7 Oct 2019 13:51:04 -0400
Received: from mail-eopbgr740131.outbound.protection.outlook.com ([40.107.74.131]:16229
        "EHLO NAM01-BN3-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1728031AbfJGRvE (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Mon, 7 Oct 2019 13:51:04 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aUgk3TAaLNC+fXAu6dHt32FilhRbdzlkHlwuNmrkqVyj88fgkqo5UfllR0lsE2iNaiyac091rynZyTGrOTMXgXxfCVGlZb2Ic0N0EvV9GAKXnOvO/q06ft8YjMU2Wz2ujVMO20LRHnS+jV8/tYjt1ExnsE/few4bjcfinUjlp+RrK6aReHfthuHvLkKC9+9c7b8hxVLgp7K7uaUGcTCA4x1+KGsN8T0wvK6MSu/BKc3IqA4U//GI2PkLYQEyBZR+tt14lqJpySHGJY+mNb3ntKyIgtiXQNbTR2kpiuEfA2GskIgVaX7HdoHxqUt6/pZCuXlEKYHiW3xZJqYTZAFi4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pJv2LXQ2gju4joDcjHnX3/jwTW2xcvDa0HQ75rcl7u8=;
 b=gXRxWx4HgPuO9bQw2EF0rhv4FSnA49E4xh707hrHuSiIbJXzkw5EK1S6glNT0S8K3jli60J/3KI4EiDuRxdzdsCp9tGHTI8fBpci2cIM/CxYPS14/PzJQ+i3fbitm0C1JfE1INxUaOpg6u8B0gsLLla+DRJljlKZgXNATJM0MIYHuITIRj4mLtKSutQeIIwf2Cas8S5kNlp+af67EivQUVKRdWklbP6wqlnVhVtXlr7BDgCghqJRZRYffxeTJDuTGd+jOcU4JfwMIlcEC/GIERsefl6ESxrI2RCr3dlMC5w4/AujGFBEllo/mqhjU/t9ahCbQ9cwWVGcstnIEyrlDw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wavecomp.com; dmarc=pass action=none header.from=mips.com;
 dkim=pass header.d=mips.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wavecomp.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pJv2LXQ2gju4joDcjHnX3/jwTW2xcvDa0HQ75rcl7u8=;
 b=bDXcqEj/LRhNcXr295yo/nRtSR4A85UHueENVcfU+yTsGIH1cJ/gm3u9IbYwVIhKMPcfjB+M4/MuWf/SHF+/nyi7rm7K2Ea8XQ1sPTL+kb09sal5O7uPRNNwXxaBpROoScMjUnqnA3c41rgA1CBdAoGvNYFVOlJx/FilelxJXJs=
Received: from MWHPR2201MB1277.namprd22.prod.outlook.com (10.172.60.12) by
 MWHPR2201MB1232.namprd22.prod.outlook.com (10.174.160.7) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2327.24; Mon, 7 Oct 2019 17:51:01 +0000
Received: from MWHPR2201MB1277.namprd22.prod.outlook.com
 ([fe80::3050:9a38:9d8e:8033]) by MWHPR2201MB1277.namprd22.prod.outlook.com
 ([fe80::3050:9a38:9d8e:8033%5]) with mapi id 15.20.2327.025; Mon, 7 Oct 2019
 17:51:01 +0000
From:   Paul Burton <paul.burton@mips.com>
To:     Stefan Roese <sr@denx.de>
CC:     "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
        Paul Burton <pburton@wavecomp.com>,
        Harvey Hunt <harveyhuntnexus@gmail.com>,
        John Crispin <john@phrozen.org>,
        "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>
Subject: Re: [PATCH 1/4 v4] MIPS: ralink: mt7628a.dtsi: Add I2C controller DT
 node
Thread-Topic: [PATCH 1/4 v4] MIPS: ralink: mt7628a.dtsi: Add I2C controller DT
 node
Thread-Index: AQHVfTfIEgxUKXT2N0SZ6b8fHaopQQ==
Date:   Mon, 7 Oct 2019 17:51:01 +0000
Message-ID: <MWHPR2201MB127759D7CE7C6A836734228FC19B0@MWHPR2201MB1277.namprd22.prod.outlook.com>
References: <20190812103655.11070-1-sr@denx.de>
In-Reply-To: <20190812103655.11070-1-sr@denx.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: BYAPR08CA0051.namprd08.prod.outlook.com
 (2603:10b6:a03:117::28) To MWHPR2201MB1277.namprd22.prod.outlook.com
 (2603:10b6:301:18::12)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=pburton@wavecomp.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [12.94.197.246]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 7da16d72-7f74-4797-99b0-08d74b4eea7b
x-ms-traffictypediagnostic: MWHPR2201MB1232:
x-ms-exchange-purlcount: 4
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MWHPR2201MB123258CF8D0B2151A622E6D1C19B0@MWHPR2201MB1232.namprd22.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4303;
x-forefront-prvs: 01834E39B7
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(979002)(39840400004)(366004)(396003)(376002)(136003)(346002)(189003)(199004)(74316002)(386003)(966005)(71190400001)(44832011)(4326008)(33656002)(102836004)(71200400001)(6506007)(5660300002)(256004)(6916009)(14454004)(6246003)(8936002)(55016002)(54906003)(305945005)(6116002)(11346002)(2906002)(446003)(186003)(26005)(3846002)(6306002)(486006)(66066001)(9686003)(476003)(6436002)(66946007)(316002)(229853002)(81166006)(42882007)(478600001)(7696005)(52536014)(25786009)(52116002)(99286004)(8676002)(66556008)(66476007)(64756008)(7736002)(66446008)(81156014)(76176011)(969003)(989001)(999001)(1009001)(1019001);DIR:OUT;SFP:1102;SCL:1;SRVR:MWHPR2201MB1232;H:MWHPR2201MB1277.namprd22.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: wavecomp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: rFqo3hIZRzlDSiqCLtgfZVNxayN/txJ/1G6nSuGHPYtzfB024zEYShsaZ9uaRUHDvMNcFu00+rt8sDebaEYAhMYWBj6ehuf6lR19yVlMVGDUdVOW3F/3oBALYfXST8+iMRmpL92Gake4a0UGb4kIubf5rK8rHAmEkaPDMMYqtYFUsuMYa3P/HDYyjab9itGen1rhFxTlfpuuIxEqLUKoXRJlUpncIFkJRZQegFCm4wdV8gHosiWKCc09bUStdL6Fc/WY1BDUMA2fYZkjb8zp9fgBCFPSQqKJyz/bf2lAOay/TuoNtqvU/mI/7oeVd2AhqRg9iPZrm6LrIGCGoRXgQrBPU1IYpBuf9oVbOvPOf5ASc0nJjdq4Pf4qhKA+q+q+o8mNzIkBnWtDWhNmLK9AjuP+JD5oMM48eWAMCYf5I9wkgf57wlflMiN9T9XMzOzcnQSNWO+3TdvHjjdFgqM0nw==
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: mips.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7da16d72-7f74-4797-99b0-08d74b4eea7b
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Oct 2019 17:51:01.1854
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 463607d3-1db3-40a0-8a29-970c56230104
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: zFsv9a4Wqgpc8NOJyKB3x0wqIRvY+tMgJt8vlv7lpVyxkLrKp0G/NT7svL9KmsY9PdGzgxd6ScGFdcHtqbmjLQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR2201MB1232
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hello,

Stefan Roese wrote:
> This patch adds the I2C controller description to the MT7628A dtsi file.

Series applied to mips-next.

> MIPS: ralink: mt7628a.dtsi: Add I2C controller DT node
>   commit cd5f9e4fd879
>   https://git.kernel.org/mips/c/cd5f9e4fd879
>  =20
>   Signed-off-by: Stefan Roese <sr@denx.de>
>   Signed-off-by: Paul Burton <paul.burton@mips.com>
>=20
> dt-bindings: mips: Add missing mt7688a-soc compatible
>   commit cf892abfab77
>   https://git.kernel.org/mips/c/cf892abfab77
>  =20
>   Signed-off-by: Stefan Roese <sr@denx.de>
>   Reviewed-by: Rob Herring <robh@kernel.org>
>   Signed-off-by: Paul Burton <paul.burton@mips.com>
>=20
> dt-bindings: mips: Add gardena vendor prefix and board description
>   commit 4ce8a03c4176
>   https://git.kernel.org/mips/c/4ce8a03c4176
>  =20
>   Signed-off-by: Stefan Roese <sr@denx.de>
>   Reviewed-by: Rob Herring <robh@kernel.org>
>   Signed-off-by: Paul Burton <paul.burton@mips.com>
>=20
> MIPS: ralink: Add GARDENA smart Gateway MT7688 board
>   commit 376357aca715
>   https://git.kernel.org/mips/c/376357aca715
>  =20
>   Signed-off-by: Stefan Roese <sr@denx.de>
>   Signed-off-by: Paul Burton <paul.burton@mips.com>

Thanks,
    Paul

[ This message was auto-generated; if you believe anything is incorrect
  then please email paul.burton@mips.com to report it. ]
