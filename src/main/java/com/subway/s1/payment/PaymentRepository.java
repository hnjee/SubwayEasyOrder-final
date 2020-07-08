package com.subway.s1.payment;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import com.subway.s1.member.MemberVO;

@Repository
@Mapper
public interface PaymentRepository {
	public int paymentInsert(PaymentVO paymentVO) throws Exception;
	public List<PaymentVO> paymentListByStore(MemberVO memberVO) throws Exception;
	public int paymentUpdate(PaymentVO paymentVO) throws Exception;
	public int paymentTotal(MemberVO memberVO) throws Exception;
	public int getEachTotal(MemberVO memberVO) throws Exception;
}
