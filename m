Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 734BA39FEF1
	for <lists+linux-mips@lfdr.de>; Tue,  8 Jun 2021 20:21:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233401AbhFHSXg (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 8 Jun 2021 14:23:36 -0400
Received: from esa1.hgst.iphmx.com ([68.232.141.245]:5438 "EHLO
        esa1.hgst.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232025AbhFHSXf (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 8 Jun 2021 14:23:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
  t=1623176502; x=1654712502;
  h=from:to:cc:subject:date:message-id:references:
   content-transfer-encoding:mime-version;
  bh=B1A7S8etgxAlPuhTXtHBrf9Vm1ryvdsp3EXV/NOZPug=;
  b=MyQds4w4giQGVTdIrLiXFODN8mTo9MdDtDMR9GO2d+n6/Xdaj+pzCftw
   UazeAtu8RXrXhgULPI/Ox6bTw5BWIB7uZIcMoh1C1w2ziF8V6GLJyqcwp
   dXXloU74SYkIm3tMRkz0oR0Ez95TdDkQ004hvxogIUAkGUjbvAR6IM9CR
   dXdAotta9RinlzJlrYawux6QRXeqaxYSJ50BWE1wfeYiao2gjWZCHi/dt
   o1wYnXtsapxyGy6Uwf0+srfPVYWjZ7ijqWEorXExQ/bS20klInB2jiusi
   nmpEHvZKmJVvs+6JxVRCVnNp4Bf0BQpaTykIYCY2hNwZIfKDp0jnl/azQ
   w==;
IronPort-SDR: D0EOo9vo6Sf64foQ1iOLke0jmUi3EfgYvZK2+CznZ2dbOowV2PHZNwrPl43u7kzR7Krn5/H1yo
 LepnCSxNl8Z2ER5ULftVyPBEEKdfruKa8cKCuMfJok722P7Hj95/WO6JFepaewqk5xINQ5zO3v
 K9bYnk8kRecxezDV1PddaypfNg0bBXtcU/CeO7awg9bC83v10ahPaB4mHq8kNQF9rfuXfOwMpf
 t5z/AqIixd7OrvkXBOYDGogI9SyIwg39aiE60NAWXvPzFWvhsiyGd2a68A0cBDcCO+GsOBjqUI
 tSc=
X-IronPort-AV: E=Sophos;i="5.83,259,1616428800"; 
   d="scan'208";a="282616841"
Received: from mail-dm6nam11lp2174.outbound.protection.outlook.com (HELO NAM11-DM6-obe.outbound.protection.outlook.com) ([104.47.57.174])
  by ob1.hgst.iphmx.com with ESMTP; 09 Jun 2021 02:21:41 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Vn/0w2hUDCyTnV12Yp7AIwrL80woGJ+GpuAXIHOfyeZHypVg+p2R5HsGy/AH0eYOLAp+MPwF2oh2nL+9PLp7EpRuJ0srhjMv+0Hz3fZauH3yMVMu6Y0UNnzuD/TdrJ/5IYa2eA+9kZlsWGmknH/AQB2jz7hQpPbK6DyjoQGULkfXSYbfyxhjAkOjpRfGVKHOuuPRp1NK/pS7Uds/i2VPtEW80HqyYFmvZdaz5SQQVijlxtE33wcOlnyInujjKoP2Z+iXORZouq1dQTXh0RraztfyPCxoueMT/uksvpLnWTw5X8TcndBKUrpNKAiKi1DcG8vlQbKJIzKQrfrz3oLB9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=B1A7S8etgxAlPuhTXtHBrf9Vm1ryvdsp3EXV/NOZPug=;
 b=OzKQO7Ss07//O0RKwR6FSrCumxGxH0AtlTby2SX8fcfCtjBGtS+NlzuTV3mwHxZtRwHwRpXYYzcKwOMupiWAHgYottuKkMarTj7x2+GdAC409Y6bRkYGi77RYks3zdu0Cw84hKfZxtM+bnu2ABkKwGJcxlhaRA3NSyHpMq9gioqIAUjHUFuY7IWw4om4pYrUw403HyqoKYRYWkttcaQKM40JWUMTnLyfPxZPuhAeQWm4ZgC1BSVga6mX/znHtP4VWqaK65Z83ndP5ttFHi70NaeHD2ETUegtcuhKNAZbKBLkhWK9DwlFTeYGSlxoFgPhovDkcna0dUT/SsJzWZDv/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=B1A7S8etgxAlPuhTXtHBrf9Vm1ryvdsp3EXV/NOZPug=;
 b=T1B690+AFKI2KX5jdJjfimqsoJaMeLBg4zhuGIKvLp5ZJkKXJSdNs2GvcuAkG+UUzsiYIobznhfQ5nOGt+cP4gQudQi+/KqsTOM6h9wO+eTRdIQ6ujUl3j+URdxEZfsXXezMJHE6YObQP4rlSh+WXEV4LW3P7wbw+qkG8LBCzkA=
Received: from DM6PR04MB4972.namprd04.prod.outlook.com (2603:10b6:5:fc::10) by
 DM6PR04MB4587.namprd04.prod.outlook.com (2603:10b6:5:2c::28) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4195.20; Tue, 8 Jun 2021 18:21:40 +0000
Received: from DM6PR04MB4972.namprd04.prod.outlook.com
 ([fe80::8dc6:ecf:9d83:615f]) by DM6PR04MB4972.namprd04.prod.outlook.com
 ([fe80::8dc6:ecf:9d83:615f%7]) with mapi id 15.20.4195.030; Tue, 8 Jun 2021
 18:21:40 +0000
From:   Chaitanya Kulkarni <Chaitanya.Kulkarni@wdc.com>
To:     Christoph Hellwig <hch@lst.de>, Jens Axboe <axboe@kernel.dk>
CC:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Geoff Levand <geoff@infradead.org>,
        Ilya Dryomov <idryomov@gmail.com>,
        Dongsheng Yang <dongsheng.yang@easystack.cn>,
        Mike Snitzer <snitzer@redhat.com>,
        Ira Weiny <ira.weiny@intel.com>,
        "dm-devel@redhat.com" <dm-devel@redhat.com>,
        "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-block@vger.kernel.org" <linux-block@vger.kernel.org>,
        "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
        "ceph-devel@vger.kernel.org" <ceph-devel@vger.kernel.org>
Subject: Re: [PATCH 05/16] bvec: add memcpy_{from,to}_bvec and memzero_bvec
 helper
Thread-Topic: [PATCH 05/16] bvec: add memcpy_{from,to}_bvec and memzero_bvec
 helper
Thread-Index: AQHXXIBV9T5WIt1S2Uab8yp3MsdRyw==
Date:   Tue, 8 Jun 2021 18:21:40 +0000
Message-ID: <DM6PR04MB497275ADBEE4B142232A130E86379@DM6PR04MB4972.namprd04.prod.outlook.com>
References: <20210608160603.1535935-1-hch@lst.de>
 <20210608160603.1535935-6-hch@lst.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: lst.de; dkim=none (message not signed)
 header.d=none;lst.de; dmarc=none action=none header.from=wdc.com;
x-originating-ip: [199.255.45.62]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 2b7c664e-3f6d-4280-901f-08d92aaa42ff
x-ms-traffictypediagnostic: DM6PR04MB4587:
x-microsoft-antispam-prvs: <DM6PR04MB458743C046E044061DD55D5586379@DM6PR04MB4587.namprd04.prod.outlook.com>
wdcipoutbound: EOP-TRUE
x-ms-oob-tlc-oobclassifiers: OLM:404;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 2LwhJ1dkneYYuTX5r6b7umT2DO2BH+Mqbg0qGPCGr0t/4MK26uw8SLK5jj3VhR+BI7CVoxCtFoSAYAw7+RRz4LVjemWWB63e2vrfvnvm7CroIrXcKdQh3wXh5iu1LX+G3clE7xai7Wn565MHM+YdnbuQ73cO6cTqb1OT+6AAHPcj+BPjWK9fdRvpt2yB8C7kA0OeARnmoH3gV+GKiVEOa3us5Neb7fGewaO0DB7jzGfkgEXkB6CHmRA/98I7AgJsksybRODeV+2A7Ny9ASjSGjG2WrXm9ETRhuZIheE75fIcpR7nUdQRlD0l2rveDPfmg18endw6rFulgf4YlhExbBYxw9H33lAQslC1OuveKZ1pV2KD473j3672l7H8br59QQ77j+qcHDMxmXfykNzAqSN0FC9hTVijWtg9/+JQVWflANzTLP/b4lFM1zLP+7V5gqUb7mtkcw1byTXfxJc7YrFTs1NCPLjhZ3vjmIwHYb8FbckBnUEuU7v396Xa1Ti65lcwCdbcxazQhD1Ogoasb7CXVh91sUPygS9dtXiN8/NpBQNJQTglcXvWOZXV1EWuTZc0Tbg5hTIinLdqqHObKf0yr5GunStR/UFm6o5Qv28=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR04MB4972.namprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(376002)(136003)(346002)(366004)(39860400002)(26005)(54906003)(186003)(86362001)(4326008)(110136005)(6506007)(8936002)(66556008)(52536014)(66446008)(66946007)(53546011)(7696005)(71200400001)(9686003)(64756008)(33656002)(55016002)(316002)(7416002)(91956017)(122000001)(76116006)(558084003)(5660300002)(38100700002)(2906002)(8676002)(478600001)(66476007);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?0V5fxzwjnqTJ9LlohUc79NiL/d13as4ZcMTX5FdlloDgnSvjNI1liWVpwUC+?=
 =?us-ascii?Q?k2AMIkZN6+0EDos+paTrEo5QIea/KfohNdxHDFttu6L2Kd3Np50Srae/LCfx?=
 =?us-ascii?Q?oOnm/Ighqo0GNRa4PBq5AnAzQPWRHPSF0IrZCrHQ2FaqYy6sB7EPy+zqsmlN?=
 =?us-ascii?Q?ov8XS6AA/DkquDdZ+rIwKkWgERGhS/W1rAZm6KYAsoSRJglk09+4eu62tEEi?=
 =?us-ascii?Q?JK/iJAf4lNjStGiCuyBHclQyPT/tP8VPzRCvShHaxtKbfpaf9pxh+cfE9WAM?=
 =?us-ascii?Q?ALoZpSj4p+m2FMnHB4Q44eYO647fHjhbFiVik9V988JXreDiZ0xfIEFuR7Sr?=
 =?us-ascii?Q?cbuT/U+M25ULVQsywu6RUZLLOxoUktNdJGlHbuOtipsN+gWkRm0dE3QPTJ1K?=
 =?us-ascii?Q?24BeHjBw287iaf9FLrlcJhfOgtC/v0sjAsCiI/oT+QcSBWWFCmx+uqXGNlY9?=
 =?us-ascii?Q?rknNps6lBrJ+xkYY+IWBNEYVkuilXwvUNUrmeYBt9YjBS9i6bJB2D4wYOpE4?=
 =?us-ascii?Q?aq9lUJ1EvL2hTbp+hrIBoBRyPsZqMNctqW+P69UbLgIYZlU9HlXS4qa8inRT?=
 =?us-ascii?Q?HwUfno1nR0SLkZBLIJ6vO7unC8fq8Z1OzSItXNdHYbVXmoVAdU5T2ZQd1KA2?=
 =?us-ascii?Q?K846R5hn3WGkNKx3nEpgAGpmdbkOzpC51Q5Z1vgtTVVkxZuy1fRO6PvupUfk?=
 =?us-ascii?Q?ZJCtBQ8IZ7DcFbiUKJdr3IUMXiNPAnldRcl9yMrk57k8oKXrDbRhOTrBkcTd?=
 =?us-ascii?Q?ROpefMAP0GNQc80qKMAhN1CwdWwMD/sabu13wpEs+vY7Qye+818WjOu0BxvT?=
 =?us-ascii?Q?mVOkXnWWfSXjgbJMq5s1h+t4BniyS0FRcEpbbGhxi7wXJkxQZdeAUX1ZCYZ/?=
 =?us-ascii?Q?H0B/kmI7NA2usrkcHLsIgRcD6exGgm79BwaAsTF3q/n/FWP7E7ox+o9gyPvV?=
 =?us-ascii?Q?BdOeuocIgnMkinBnt3odSNH+M5/c5YaBYWzL0pQ4KGvx8wQK3h4AVk+MIwtT?=
 =?us-ascii?Q?P5cqcUggdwKSoc0i/ckA0wuXYW6+3AVi34t4JRSrKyyK1CsMk7/GXODIQdZz?=
 =?us-ascii?Q?uPoqskkPVn9IFWTe+C8E1x4VMz7EdR485p4FhKBGpJGZfya+3Vkuycw82zyk?=
 =?us-ascii?Q?LKYaAKbNArkcH1pW9oEnATmwtj4o/H51XJStcslRignHnoW5Ffs/bsdD1Ot4?=
 =?us-ascii?Q?8oA0uQ0ntYtYY6F1S+Il/7bn5NmM0o5CpgG7joi6b0aOVV8fTIoT4Rtu5nkg?=
 =?us-ascii?Q?YMiM2vfUgIIgIRZqBcdjNMHQ5epxN+SoPBFz2SwlUWHOt3uIdy3TGstqZzUV?=
 =?us-ascii?Q?uElufMxsSx1CQW+d5oG4mt9C?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR04MB4972.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2b7c664e-3f6d-4280-901f-08d92aaa42ff
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Jun 2021 18:21:40.4648
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: CEHBPI53GFZGoZKQIAmINWn74moJ5tth10uMP6xReaQTZDdz0qaMiehkBnZBDrqsXmdsXpbKHNKkjEyYtFHCW2cugW4NnZW3Y15qVZo68U8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR04MB4587
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On 6/8/21 09:07, Christoph Hellwig wrote:=0A=
> Add helpers to perform common memory operation on a bvec.=0A=
>=0A=
> Signed-off-by: Christoph Hellwig <hch@lst.de>=0A=
=0A=
Looks good.=0A=
=0A=
Reviewed-by: Chaitanya Kulkarni <chaitanya.kulkarni@wdc.com>=0A=
=0A=
=0A=
