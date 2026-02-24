Return-Path: <linux-mips+bounces-13192-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id bJlDMKELnWnLMgQAu9opvQ
	(envelope-from <linux-mips+bounces-13192-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Tue, 24 Feb 2026 03:23:29 +0100
X-Original-To: lists+linux-mips@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 04790180F8F
	for <lists+linux-mips@lfdr.de>; Tue, 24 Feb 2026 03:23:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 10208304A304
	for <lists+linux-mips@lfdr.de>; Tue, 24 Feb 2026 02:23:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AAEB22459D1;
	Tue, 24 Feb 2026 02:23:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b="DFjmn41e"
X-Original-To: linux-mips@vger.kernel.org
Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazolkn19011010.outbound.protection.outlook.com [52.103.66.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 527391A9FBC;
	Tue, 24 Feb 2026 02:23:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.66.10
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771899804; cv=fail; b=Y35XD8KbSBrH8z0obLMOYCUYQGLHe+JVhpB2zafZlWzR9PxG5kbrcy2UOrT2dHvpSYQYTYXS+Co6ScJqUmTYMCPvczqaKJkYzKZTfTUMep9+PVQ6FMkrl4kAn/WfKCtKObUomOaYW/Em5x7KppS9tjrOZ1Pjwa/7zAoiMhWIBiI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771899804; c=relaxed/simple;
	bh=BDW0djVBFUNPVPIDmunMQkap6g1qoAk6BB6lFbCZP5g=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=E1OzK8W5/QuW7YuuHcv8a7L7GcoXtdj13oKJabLk5kbwulbj4SVrm6je4DIb9+1xm55F5cG06X6jdTbF/NIMznK+Qf1RThRQMhNbvXLOtaCIQPxLtFbl3ceQP0cE1j+NK2unlrwMRRyQR65Y6VjpQrBdGN8B0EklBIiTLdeSnT4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com; spf=pass smtp.mailfrom=outlook.com; dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b=DFjmn41e; arc=fail smtp.client-ip=52.103.66.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=v3rxheDc4Ai6tpFRf3/HfQfImjGgiOLipOkCOgrmJeoJ8sAAw0zHj44U/JwLiLet+0khaGs+33VQMqCc6OhfpGLOC8oi8UTgCBNuPTd3k9gmMW3KsXIOQX7fc/pCGy6kmJjJricEDrI4oseWKST+fVQHBUJTFTo9fCCerc0y6uwB98wexb9+LD3T2vJO1xoharIbusxXhBjCwYMW/hRUt7QSHYFx7L4jh0xLVmlycSqVQMu3gps7+OcubOtB2fpIhXPhu8ys1p7U8Si2W2hKO9QvCezzlTcOeR79W1CmRsYeNIk9I0JkK09ad0GvoNn2f/+hQFvv9J2wvNjV95pIVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OnKocjp10SXwUG3DkdlhcG9ILxIjbt+cksEXCV0IyI4=;
 b=NtG7bR7LmpeCMBu1CNXusxmdGLDioCJ05TVQHHs7wuIM4ZKoOZcrHsohzgymW05ZupaVEvDG71s2cmEWOr0/jllsQK6axXV3rkgj79IDT4yxwwQi3TRsHhiqG3K7BbwKDoApaAK0PCTqxFWLdXjUr6Kby+IHKhju9+tlbmV651FaMEQjrVnql5uM1ImQBbsI7oZn6aMaw6/LaxlsfB1TvZyrTiqcq20m2AzUJjCR2l81wDZPucdMdLXsxU7W49kjIBL/H5A0HSy9x35VGpyMUw+3kOrb5zrEIF2nA9A2ipMGxW/WyGig/vpssmipv+Zm3twU31qz9thOJN27EDreKw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OnKocjp10SXwUG3DkdlhcG9ILxIjbt+cksEXCV0IyI4=;
 b=DFjmn41eil3F/oZ2SZi/pFWExTK6mvnTZWbyNEK5qi6d0GffST9CRTNYSYPByhM+qx8Bo1iedk7OmZ4/EXNMPc+Ip4O8PTrNHQZMxSDqHYSoO7Y0ZsnaVryDH3uMDJS+2F5dVSHnogQ+e4xPAaJGKAtGE+zAX0PRJwnI5JHAokB5lzp22E8fWcXgRKjHxaojbC9NrOeLLzYGQU0jh5g8HmV3ZLv5CiTEFsoGG3EQIM6evfEO2FVrbTK8IAweQ8hfWm3FG47P2aOr+d9Vm8FN/xKNGXQSPrCcC5Wvt4wWEDm7baIO2jcA/DZbmk8aVaI2j0uS9j1ZtXS1tGZnAK4Qjw==
Received: from OS7PR01MB13602.jpnprd01.prod.outlook.com (2603:1096:604:359::9)
 by OSCPR01MB15557.jpnprd01.prod.outlook.com (2603:1096:604:3c1::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.22; Tue, 24 Feb
 2026 02:23:18 +0000
Received: from OS7PR01MB13602.jpnprd01.prod.outlook.com
 ([fe80::7a94:8782:9191:8d50]) by OS7PR01MB13602.jpnprd01.prod.outlook.com
 ([fe80::7a94:8782:9191:8d50%6]) with mapi id 15.20.9632.017; Tue, 24 Feb 2026
 02:23:18 +0000
From: Shiji Yang <yangshiji66@outlook.com>
To: linux-mips@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: John Crispin <john@phrozen.org>,
	Sergio Paracuellos <sergio.paracuellos@gmail.com>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	stable@vger.kernel.org,
	Mieczyslaw Nalewaj <namiltd@yahoo.com>
Subject: [PATCH] mips: ralink: update CPU clock index
Date: Tue, 24 Feb 2026 10:22:50 +0800
Message-ID:
 <OS7PR01MB136024C7662EB4DEC04ABC648BC74A@OS7PR01MB13602.jpnprd01.prod.outlook.com>
X-Mailer: git-send-email 2.51.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR01CA0013.apcprd01.prod.exchangelabs.com
 (2603:1096:4:191::9) To OS7PR01MB13602.jpnprd01.prod.outlook.com
 (2603:1096:604:359::9)
X-Microsoft-Original-Message-ID:
 <20260224022250.31169-1-yangshiji66@outlook.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS7PR01MB13602:EE_|OSCPR01MB15557:EE_
X-MS-Office365-Filtering-Correlation-Id: 5b246894-17df-4bf7-19e1-08de734babf6
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|461199028|41001999006|21061999006|8060799015|19110799012|23021999003|15080799012|5072599009|5062599005|53005399003|40105399003|3412199025|440099028;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?kXfgW8hC5Q41qnHSMln7WDc2EJvW9kWgwLCM/zHG/0XVt6kk5HKm/lwz41sP?=
 =?us-ascii?Q?/3JgzLn1s9imQulbmMA6cspMOCLRSWYRSvJ3uyzZGWDH99tvRdzn+g3HcYZ1?=
 =?us-ascii?Q?zPjlHf/mzZ+F28tiFNhGrFGEcD1/tqYGV6NAApEcEfua2YJGHDhyteXIgAwy?=
 =?us-ascii?Q?lVyE9DqT03epWGtcPe98/9kNhep70ofy+zDizXV9PG8FD06r00NRVBgnNUKj?=
 =?us-ascii?Q?HOegX8TGQLfhjjmj8pcQPNab7FAy936Y/AcYXaZ2eyzfF1DLgWkiVUFZPufH?=
 =?us-ascii?Q?JY3L9/pb9eD7H13WoIacM1G9+9eVolQkNXWocX4hYSm/DT8hxbAmWm4sMsI0?=
 =?us-ascii?Q?JCQWeMXYndu6HmqfiznIptyxpPyYpFK1v6Kwlf6DAcWudTNUZ4OfIdeyWmHi?=
 =?us-ascii?Q?e7YDgt09wzk36sltdpMH3F1ExpHOw+OSb0nsV2fdhcWZRMAPn8Oa54n63q6y?=
 =?us-ascii?Q?gA9oxWgVcxmn1ioyOyRfdZKvVitgigZBRg2b85j1bRGbYBoFzD6K42CPnafI?=
 =?us-ascii?Q?u4duWxe7WCjI2hMtuijNawAZO2Urd9XHmOai8f8leYQyEQt51RAfRLD0lvNA?=
 =?us-ascii?Q?k2rvfkGM2Xy9ThDMLMKySNKNKraxYsHsGgROW/WZ3wbdowxS9yRZh6SPeH92?=
 =?us-ascii?Q?kUw8zZJIFHRFu58lB5ZGpH7gCVXMAZzjJGVDek0ORZYfFm8FcBKFF8O8Pzww?=
 =?us-ascii?Q?XC3/s7UESgpVxFxmXEXLiU/6fOsHO4EbJBUvCtezjoOeauAIDXIov7eHv1gf?=
 =?us-ascii?Q?ZdUT/NupsdCSiH7QANazyZh2M2sPoLD22fDEuLPDSimooHjMq+rayWzXi89P?=
 =?us-ascii?Q?fMS+qEvKAtPeQ3vkbTutoNLEqoDzJA4zXLEQQixiEkcXeYh9saajYJRTa+7S?=
 =?us-ascii?Q?TPeEQKE6b4W/BFp5XRuIRG1InioiIH5KBiP2luvmq3WDK0uTUc47ZVlTIAnd?=
 =?us-ascii?Q?hJ4Mp5Q/YWBJlfdW4vQ8shQaLbcUf4jMHtOBQkFMLpREi0ZkfkUx7CITrugd?=
 =?us-ascii?Q?JP2iUVcQCoPWmqEJ+C3rZHlUVVjVA44mdgSxRnsLE2NGEHcYrPGjb8itfJvT?=
 =?us-ascii?Q?ug/5167TIeuGVUvgpKWtqXI5bMvwc1Er+oEw+qBHeq6U5lGQe8LGmVCTJStp?=
 =?us-ascii?Q?VNhONshZF3zVDrYulwrYCz4kDFP4qhfxK6CkFK9JVMftq+OhjskTQZLl7uOu?=
 =?us-ascii?Q?tdZI7WIYywvGl1fYhyYSJZngQ7/VE3lJNSwMTVWlcQIFA3Vx5wEahT6yo3qm?=
 =?us-ascii?Q?xU/BblHIaJ9FssNdGky+ePkxShnKEnJ528hGjEDDOg=3D=3D?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?S3+JZwK/Y6oBUhYiq+JeB/LHy+1jlfZxV+MoO66jhIGEryl9GXNU2qtKM4qi?=
 =?us-ascii?Q?IQ36dx6PizwzFrcoVQCwGHkzGwTVf9C5ND5rkB9j1dgtgrKRx8bguXRoFQ3G?=
 =?us-ascii?Q?hrp43I0vdecaD+csJLERgg94EDN6wb9AZxjS5ddNDgtRJ0xQU4Vu+ZJN1hf3?=
 =?us-ascii?Q?6e1c666ffVYUibqS10SHA75kcBiyR/jpfxepXoaaCykmZfs2UGRegsiVSiI1?=
 =?us-ascii?Q?h/nY90ZFu29HXS6V8SptMg0+KlEdNNFFg2ej479QY1mlFjfS6UdOmRc6Owjl?=
 =?us-ascii?Q?5Q1Wz2EXPct4aevodvrMgRtEmnrEJbMh6cCSdQNO9xdHBtHjcr5q0bpyR8gW?=
 =?us-ascii?Q?V8eic5HxU8Mas6QnxOmu2cH8UtTJsbgUYWErtWIOHalhxt+IdK7+mL29n5DE?=
 =?us-ascii?Q?JtBIsr5lYmRLOPfCAhf/W/m6+5lMks6EKkbsBdLuoOkwAiD8whZgz3jIw3kG?=
 =?us-ascii?Q?5UZ1vXfrMX85EZHPSbxEAbwpatRWshPYIAfeF0/FSByus1W+tvbXwk79lmY9?=
 =?us-ascii?Q?HGyHpYsrvpIWYYiv3utD1KkECWeGdGaK/hxy+VkEk167p3I1y/5wKWbKrBvR?=
 =?us-ascii?Q?UWeEg9xRQtj8KrudLwnIgmuJTUhGEWbc9mmEGJoPxp+jSSH85U7TmCjHSQXZ?=
 =?us-ascii?Q?8ctF9oQB0vSHpnVKgNXGe+EKMJjKiAGUvxyltiYuysfj7hTPSlNbtRB99hnE?=
 =?us-ascii?Q?gWYBFmqb02WhzNNFEkqJY4Z05SBnLJ8nV5l90yQaXwC/Pg7FhCq8hBt55Ppc?=
 =?us-ascii?Q?HTlxqnP1d6yvJ0PL9+zpU8RcggWqtloY12x9P0l67R45wuGNY7/mk+Gjh5U6?=
 =?us-ascii?Q?Ab8Zq0rpK9d4YOfO/tdAt+rikgF+Z48/n+loyYVv6cm4oT82PC6Q9L41Sdcp?=
 =?us-ascii?Q?A0MtduIN9G7PKcmeiyHfm5tW8a4U6IuJY/bVT9K/SLF/4n2WlbbUcGgj6KVW?=
 =?us-ascii?Q?B+GQwyuqjvtdYwaV/I75jLmbNIKJvPwSU5VOgLCyfgby1AF0tAPiux+fCQCf?=
 =?us-ascii?Q?edhTJIlJ/eCI6ST0+5Awv3dX5JjC/uidItr/bAxkA27/vJjxMO8FaKgRweVv?=
 =?us-ascii?Q?QGYtOYfTR5twIK+imRVXAIIvcUQrAFaBC7TB1D0cs/zP3Bwo3pxUXeFjvYA/?=
 =?us-ascii?Q?x680YcBXBV+oi3ZsVtVReWjG3o5rbb1t8OeH0YGqeDvzl53EP1jjcR/wc4a8?=
 =?us-ascii?Q?wY9udWPC439H+K6xsgl1gtbu+/yquWA97vNHZSwGrNCxZRC4WmzQaA5FUuz6?=
 =?us-ascii?Q?1SKW45qLiB5WGEa4e2/QoRkxIzUdNvHVdxFakC8wcgjrXGIpOb+3RU9RGKVJ?=
 =?us-ascii?Q?E1bN0zQpBsBDqVZVaxHFMQHCBrTnYJ8Uqg4Lf08cpLBa5ZeHNsvV+HGc9RZW?=
 =?us-ascii?Q?KDr9OZ+GXXVdzHrL+HLsSgp29cxI?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5b246894-17df-4bf7-19e1-08de734babf6
X-MS-Exchange-CrossTenant-AuthSource: OS7PR01MB13602.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Feb 2026 02:23:18.0814
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSCPR01MB15557
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[outlook.com,none];
	R_DKIM_ALLOW(-0.20)[outlook.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[phrozen.org,gmail.com,alpha.franken.de,vger.kernel.org,yahoo.com];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-13192-lists,linux-mips=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[outlook.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FREEMAIL_FROM(0.00)[outlook.com];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[yangshiji66@outlook.com,linux-mips@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-mips];
	RCPT_COUNT_SEVEN(0.00)[7];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,outlook.com:email,outlook.com:dkim,OS7PR01MB13602.jpnprd01.prod.outlook.com:mid]
X-Rspamd-Queue-Id: 04790180F8F
X-Rspamd-Action: no action

Update CPU clock index to match the clock driver changes.

Fixes: d34db686a3d7 ("clk: ralink: mtmips: fix clocks probe order in oldest ralink SoCs")
Signed-off-by: Mieczyslaw Nalewaj <namiltd@yahoo.com>
Signed-off-by: Shiji Yang <yangshiji66@outlook.com>
---
 arch/mips/ralink/clk.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/mips/ralink/clk.c b/arch/mips/ralink/clk.c
index 9db73fcac..5c1eb46ef 100644
--- a/arch/mips/ralink/clk.c
+++ b/arch/mips/ralink/clk.c
@@ -21,16 +21,16 @@ static const char *clk_cpu(int *idx)
 {
 	switch (ralink_soc) {
 	case RT2880_SOC:
-		*idx = 0;
+		*idx = 1;
 		return "ralink,rt2880-sysc";
 	case RT3883_SOC:
-		*idx = 0;
+		*idx = 1;
 		return "ralink,rt3883-sysc";
 	case RT305X_SOC_RT3050:
-		*idx = 0;
+		*idx = 1;
 		return "ralink,rt3050-sysc";
 	case RT305X_SOC_RT3052:
-		*idx = 0;
+		*idx = 1;
 		return "ralink,rt3052-sysc";
 	case RT305X_SOC_RT3350:
 		*idx = 1;
-- 
2.51.0


